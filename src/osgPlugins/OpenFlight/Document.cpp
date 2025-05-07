/* -*-c++-*- OpenSceneGraph - Copyright (C) 1998-2006 Robert Osfield
 *
 * This library is open source and may be redistributed and/or modified under
 * the terms of the OpenSceneGraph Public License (OSGPL) version 0.0 or
 * (at your option) any later version.  The full license is in LICENSE file
 * included with this distribution, and on the openscenegraph.org website.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * OpenSceneGraph Public License for more details.
*/

//
// OpenFlight� loader for OpenSceneGraph
//
//  Copyright (C) 2005-2007  Brede Johansen
//

#include "Document.h"
#include <osgDB/FileUtils>
#include <osgDB/FileNameUtils>

using namespace flt;


Document::Document() :
    _replaceClampWithClampToEdge(false),
    _preserveFace(false),
    _preserveObject(false),
    _replaceDoubleSidedPolys(false),
    _defaultDOFAnimationState(false),
    _useTextureAlphaForTransparancyBinning(true),
    _useBillboardCenter(false),
    _doUnitsConversion(true),
    _readObjectRecordData(false),
	_preserveNonOsgAttrsAsUserData(true),
    _desiredUnits(METERS),
    _keepExternalReferences(false),
    _done(false),
    _level(0),
    _subfaceLevel(0),
    _unitScale(1.0),
    _version(0),
    _colorPoolParent(false),
    _texturePoolParent(false),
    _materialPoolParent(false),
    _lightSourcePoolParent(false),
    _lightPointAppearancePoolParent(false),
    _lightPointAnimationPoolParent(false),
	_shaderPoolParent(false),
	_textureInarchive(false),
	_reverseArchives(false),
	_remap2Directory(false),
	_Archive(NULL),
	_Archive_FileName(""),
	_Archive_KeyName(""),
	_TextureRemapDirectory(""),
	_ModelHomeDirectory(""),
	_ActiveArchive(NULL),
	_CDB_Verify(false),
	_SwapDDS2PNG(false),
	_CDBModel_Has_Sigsize(false)
{
    _subsurfaceDepth = new osg::Depth(osg::Depth::LESS, 0.0, 1.0,false);
}

Document::~Document()
{
}

void Document::pushLevel()
{
    _levelStack.push_back(_currentPrimaryRecord.get());
    _level++;
}

void Document::popLevel()
{
    _levelStack.pop_back();

    if (!_levelStack.empty())
        _currentPrimaryRecord = _levelStack.back();

    if (--_level<=0)
        _done = true;
}

void Document::pushSubface()
{
    _subfaceLevel++;
}

void Document::popSubface()
{
    _subfaceLevel--;
}

void Document::pushExtension()
{
    if (!_currentPrimaryRecord.valid())
    {
        OSG_WARN << "No current primary in Document::pushExtension()." << std::endl;
        return;
    }

    _extensionStack.push_back(_currentPrimaryRecord.get());
}

void Document::popExtension()
{
    _currentPrimaryRecord=_extensionStack.back().get();
    if (!_currentPrimaryRecord.valid())
    {
        OSG_WARN << "Can't decide primary in Document::popExtension()." << std::endl;
        return;
    }

    _extensionStack.pop_back();
}

osg::Node* Document::getInstanceDefinition(int no)
{
    InstanceDefinitionMap::iterator itr = _instanceDefinitionMap.find(no);
    if (itr != _instanceDefinitionMap.end())
        return (*itr).second.get();

    return NULL;
}

void Document::setSubSurfacePolygonOffset(int level, osg::PolygonOffset* po)
{
    _subsurfacePolygonOffsets[level] = po;
}

osg::PolygonOffset* Document::getSubSurfacePolygonOffset(int level)
{
    OSG_DEBUG<<"Document::getSubSurfacePolygonOffset("<<level<<")"<<std::endl;
    osg::ref_ptr<osg::PolygonOffset>& po = _subsurfacePolygonOffsets[level];
    if (!po)
    {
        po = new osg::PolygonOffset(-1.0f*float(level), -1.0f);
    }
    return po.get();
}

std::string Document::ArchiveFileName(void)
{
	return _Archive_FileName;
}

bool Document::OpenArchive(std::string ArchiveName)
{
	_Archive = osgDB::openArchive(ArchiveName, osgDB::ReaderWriter::READ);
	if (_Archive)
	{
		_ActiveArchive = _Archive;
		_Archive->getFileNames(_Archive_FileList);
		_Archive_FileName = ArchiveName;
		if (_Archive_FileName.substr(0, 5) == "gpkg:")
		{
			size_t posx = _Archive_FileName.find("GTModel");
			if (posx == std::string::npos)
			{

				if (_Archive_FileList.size() > 0)
				{
					std::string temp = _Archive_FileList[0];
					size_t pos0 = temp.find_first_of("/");
					if (pos0 != std::string::npos)
						temp = temp.substr(pos0 + 1);
					size_t pos = temp.find("_R");
					if (pos != std::string::npos)
					{
						_Archive_KeyName = temp.substr(0, pos);
						size_t pos2 = temp.substr(pos + 1).find_first_of("_");
						if (pos2 != std::string::npos)
						{
							_Archive_KeyName += temp.substr(pos, pos2 + 1);
						}
					}
				}
			}
		}
		else
		{
			size_t pos = _Archive_FileName.rfind(".");
			if (pos != std::string::npos)
			{
				_Archive_KeyName = _Archive_FileName.substr(0, pos);
				size_t pos2 = _Archive_KeyName.rfind("\\");
				if ((pos2 != std::string::npos) && (pos2 + 1 < _Archive_KeyName.length()))
				{
					_Archive_KeyName = _Archive_KeyName.substr(pos2 + 1);
				}
			}
			else
				_Archive_KeyName = _Archive_FileName;
		}
		_Archive->getFileNames(_Archive_FileList);
		return true;
	}
	return false;
}

bool Document::SetTexture2MapDirectory(std::string DirectoryName, std::string ModelName)
{
	_TextureRemapDirectory = DirectoryName;
	size_t pos = ModelName.rfind("\\");
	bool ret = false;
	if ((pos != std::string::npos) && (pos + 1 < ModelName.length()))
	{
		_Archive_KeyName = ModelName.substr(pos+1);
		size_t pos2 = _Archive_KeyName.find("_R");
		if ((pos2 != std::string::npos) && (pos2 + 1 < _Archive_KeyName.length()))
		{
			size_t pos3 = _Archive_KeyName.substr(pos2 + 1).find("_");
			if (pos3 != std::string::npos)
			{
				_Archive_KeyName = _Archive_KeyName.substr(0,pos2+pos3+1);
				size_t pos4 = _Archive_KeyName.find("D300");
				if (pos4 != std::string::npos)
				{
					_Archive_KeyName.replace(pos4, 4, "D301");
					ret = true;
				}
			}
		}
	}
	else
		_Archive_KeyName = _Archive_FileName;
	return ret;
}

bool Document::MapTextureName2Directory(std::string &textureName)
{
	if (!_TextureRemapDirectory.empty())
	{
		if (_Archive_KeyName.empty())
		{
			std::string workingname = osgDB::getSimpleFileName(textureName);
			size_t len = workingname.length();
			size_t pos = workingname.find("_R");
			if (pos == std::string::npos || (pos + 1 >= len))
				return false;
			size_t pos2 = workingname.substr(pos + 1).find("_");
			if ((pos2 == std::string::npos) || (pos + pos2 + 1 >= len))
				return false;
			std::string base = workingname.substr(pos + pos2 + 2);
			textureName = _TextureRemapDirectory + "/" + base;
			std::string existDir = _ModelHomeDirectory + "/" + textureName;
			if (osgDB::fileExists(existDir))
				return true;
		}
		else
		{
			std::string workingname = textureName;
			size_t fpos = workingname.rfind("\\");
			if ((fpos != std::string::npos) && (fpos + 1 < workingname.length()))
				workingname = workingname.substr(fpos + 1);

			size_t len = workingname.length();
			size_t pos = workingname.find("_R");
			if (pos == std::string::npos || (pos + 1 >= len))
				return false;
			size_t pos2 = workingname.substr(pos + 1).find("_");
			if ((pos2 == std::string::npos) || (pos + pos2 + 1 >= len))
				return false;
			std::string base = workingname.substr(pos + pos2 + 1);
			std::string mappedname = _TextureRemapDirectory;
			mappedname.append("\\");
			mappedname.append(_Archive_KeyName);
			mappedname.append(base);
			textureName = mappedname;
			if (osgDB::fileExists(textureName))
				return true;
		}
	}
	return false;
}

bool flt::Document::SetModelExportTextureDirectory(std::string DirectoryName, std::string ModelDirectory)
{
	_TextureRemapDirectory = DirectoryName;
	_ModelHomeDirectory = ModelDirectory;
	return true;
}


bool Document::MapTextureName2Archive(std::string &textureName)
{
	if (_Archive)
	{
		for (std::string::iterator it = textureName.begin(); it != textureName.end(); ++it)
		{
			if (*it == '\\')
				*it = '/';
		}
		size_t pos0 = textureName.find("501_GTModelTexture");
		if (pos0 != std::string::npos)
		{
			textureName = textureName.substr(pos0 + 19);
		}
		else
		{
			size_t len = textureName.length();
			size_t pos = textureName.find("_R");
			if (pos == std::string::npos || (pos + 1 >= len))
				return false;
			size_t pos2 = textureName.substr(pos + 1).find("_");
			if ((pos2 == std::string::npos) || (pos + pos2 + 1 >= len))
				return false;
			std::string base = textureName.substr(pos + pos2 + 1);
			size_t iselpos = textureName.find("_D301");
			std::string mappedname;
			if (iselpos != std::string::npos && ((iselpos + 15) < len))
			{
				std::string inselstring = textureName.substr(iselpos + 5, 11);
				size_t oselpos = _Archive_KeyName.find("_S001");
				mappedname = _Archive_KeyName.substr(0, oselpos) + inselstring + _Archive_KeyName.substr(oselpos + 11);
			}
			else
				mappedname = _Archive_KeyName;
			mappedname.append(base);
			textureName = mappedname;
		}
		return true;
	}
	else
		return false;
}

std::string  Document::archive_findDataFile(std::string &filename)
{
	std::string result = "";
	for (osgDB::Archive::FileNameList::const_iterator f = _Archive_FileList.begin(); f != _Archive_FileList.end(); ++f)
	{
		const std::string comp = *f;
		if (comp.find(filename) != std::string::npos)
		{
			_ActiveArchive = _Archive;
			return comp;
		}
	}

	return result;
}

std::string Document::archive_findOtherArchive(std::string &filename)
{
	std::string result = "";
	std::string OtherArchiveName;
	std::string OtherArchiveKey;
	std::string OtherArchiveFileName;

	if (ParseTexnameToArchive(filename, OtherArchiveName, OtherArchiveKey, OtherArchiveFileName))
	{
		EArchives Erec;
		if (!Have_Ext_Archive(OtherArchiveName, Erec))
		{
			if (!osgDB::fileExists(OtherArchiveName))
				return result;
			Erec._Archive_FileName = OtherArchiveName;
			Erec._Archive_KeyName = OtherArchiveKey;
			Erec._Archive = osgDB::openArchive(OtherArchiveName, osgDB::ReaderWriter::READ);
			if (Erec._Archive)
			{
				Erec._Archive->getFileNames(Erec._Archive_FileList);
				_Extended_Archives.push_back(Erec);
			}
			else
			{
				OSG_WARN << "Archive File " << OtherArchiveName << " Exists but could not be opend"  << std::endl;
			}
		}
		for (osgDB::Archive::FileNameList::const_iterator f = Erec._Archive_FileList.begin(); f != Erec._Archive_FileList.end(); ++f)
		{
			const std::string comp = *f;
			if (comp.find(OtherArchiveFileName) != std::string::npos)
			{
				_ActiveArchive = Erec._Archive;
				return comp;
			}
		}
	}

	return result;
}

bool Document::Have_Ext_Archive(std::string ArchiveName, EArchives &ArchiveRec)
{
	for each (EArchives E in _Extended_Archives)
	{
		if (E._Archive_FileName == ArchiveName)
		{
			ArchiveRec = E;
			return true;
		}
	}
	return false;
}

bool Document::ParseTexnameToArchive(std::string &Rawtexturename, std::string &ArchiveName, std::string &ArchiveKey, std::string &textureName)
{
	std::string mytextureName = osgDB::getSimpleFileName(Rawtexturename);
	size_t fpos = Rawtexturename.find(mytextureName);
	if (fpos == std::string::npos)
		return false;
	std::string targetDir = Rawtexturename.substr(0, fpos);
	std::string ArchiveNameOnly;
	if (!ArchiveNameFromTexName(mytextureName, ArchiveNameOnly))
		return false;
	Validate_Archive_Name(ArchiveNameOnly);
	std::string RelitiveArchiveName = targetDir + ArchiveNameOnly;
	size_t tilepos1 = RelitiveArchiveName.find("\\Tiles");
	if (tilepos1 == std::string::npos)
		return false;
	size_t tilepos2 = _Archive_FileName.find("\\Tiles");
	if (tilepos2 == std::string::npos)
		return false;
	ArchiveName = _Archive_FileName.substr(0, tilepos2) + RelitiveArchiveName.substr(tilepos1);
	size_t tpos = ArchiveNameOnly.find(".zip");
	if (tpos == std::string::npos)
		return false;
	ArchiveKey = ArchiveNameOnly.substr(0, tpos);
	textureName = mytextureName;
	return true;
}

bool Document::Validate_Archive_Name(std::string &ArchiveName)
{
	size_t spos = ArchiveName.find("_S001");
	if (spos == std::string::npos)
	{
		spos = ArchiveName.find("_S");
		if (spos == std::string::npos)
			return false;
		ArchiveName = ArchiveName.replace(spos, 5, "_S001");
	}

	size_t tpos = ArchiveName.find("_T001");
	if (tpos == std::string::npos)
	{
		tpos = ArchiveName.find("_T");
		if (tpos == std::string::npos)
			return false;
		ArchiveName = ArchiveName.replace(tpos, 5, "_T001");
	}

	return true;
}

bool Document::ArchiveNameFromTexName(std::string &textureName, std::string &ArchiveName)
{
	size_t len = textureName.length();
	size_t pos = textureName.find("_R");
	if (pos == std::string::npos || (pos + 1 >= len))
		return false;
	size_t pos2 = textureName.substr(pos + 1).find("_");
	if ((pos2 == std::string::npos) || (pos + pos2 + 1 >= len))
		return false;
	std::string base = textureName.substr(0, pos + pos2 + 1);
	ArchiveName = base + ".zip";
	return true;
}

osg::ref_ptr<osg::Image> Document::readArchiveImage(const std::string filename)
{
	if (_ActiveArchive == NULL)
		_ActiveArchive = _Archive;
	if (_ActiveArchive)
	{
		osgDB::ReaderWriter::ReadResult r = _ActiveArchive->readImage(filename, getOptions());
		if (r.validImage())
		{
			r.getImage()->setFileName(filename);
			return r.getImage();
		}
	}
	return NULL;
}

void Document::archiveRelease(void)
{
	if (_Archive)
	{
//
//		osgDB::closeArchive(_Archive, false);
//
		_Archive.release();
		_Archive = NULL;
	}
	for each (EArchives E in _Extended_Archives)
	{
		osgDB::closeArchive(E._Archive, true);
		E._Archive.release();
		E._Archive = NULL;
	}
	_Extended_Archives.clear();
}

double flt::unitsToMeters(CoordUnits unit)
{
    switch (unit)
    {
    case METERS:
        return 1.0;
    case KILOMETERS:
        return 1000.0;
    case FEET:
        return 0.3048;
    case INCHES:
        return 0.02540;
    case NAUTICAL_MILES:
        return 1852.0;
    }

    return 1.0;
}
