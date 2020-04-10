/*
 * This library is open source and may be redistributed and/or modified under
 * the terms of the OpenSceneGraph Public License (OSGPL) version 0.0 or (at
 * your option) any later version. The full license is in the LICENSE file
 * included with this distribution, and on the openscenegraph.org website.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * OpenSceneGraph Public License for more details.
*/

//
// Copyright(c) 2008 Skew Matrix Software LLC.
//

#include "TexturePaletteManager.h"
#include "FltExportVisitor.h"
#include "ExportOptions.h"
#include "DataOutputStream.h"
#include "Opcodes.h"
#include <osg/Notify>
#include <osg/Texture2D>
#include <osgDB/FileNameUtils>
#include <map>
#include <iostream>
#include <algorithm>
#include <string>
#include <sstream>
#include <iomanip>
namespace flt
{


TexturePaletteManager::TexturePaletteManager( const FltExportVisitor& nv, const ExportOptions& fltOpt )
  : _currIndex( 0 ),
    _nv( nv ),
    _fltOpt( fltOpt )
{
}

int
TexturePaletteManager::add( int unit, const osg::Texture2D* texture )
{
    if( (!texture) ||
        (!texture->getImage()) )
        return -1;
#ifdef _DEBUG
	std::string imgname = texture->getImage()->getFileName();
#endif
    int index( -1 );
    TextureIndexMap::const_iterator it = _indexMap.find( texture );
    if (it != _indexMap.end())
        index = it->second;
    else
    {
        index = _currIndex++;
        _indexMap[ texture ] = index;

        // If there is no .attr file, write one
        _nv.writeATTRFile( unit, texture );
    }

    return index;
}

void
TexturePaletteManager::write( DataOutputStream& dos ) const
{
    int x( 0 ), y( 0 ), height( 0 );
    TextureIndexMap::const_iterator it = _indexMap.begin();
    while (it != _indexMap.end())
    {
        const osg::Texture2D* texture = it->first;
        int index = it->second;
		//GAJ put remap of name here
        std::string fileName;
        if ( _fltOpt.getStripTextureFilePath() )
            fileName = osgDB::getSimpleFileName( texture->getImage()->getFileName() );
		else if (_fltOpt.getRemapTextureFilePath() != ExportOptions::NoOption)
		{
			if (_fltOpt.getRemapTextureFilePath() == ExportOptions::GeoSpecific)
			{
				std::string temp = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				size_t pos = temp.find("_W");
				if ((pos != std::string::npos) && ((pos + 1) < temp.length()))
				{
					temp = temp.substr(pos + 1);
					pos = temp.find("_");
					if ((pos != std::string::npos) && ((pos + 1) < temp.length()))
					{
						temp = temp.substr(pos + 1);
					}
				}
				fileName = _fltOpt.getTextureRemapPredicate() + temp;
			}
			else if (_fltOpt.getRemapTextureFilePath() == ExportOptions::GeoSpecific32)
			{
				std::string temp = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				size_t pos = temp.find("_L");
				if ((pos != std::string::npos) && ((pos + 1) < temp.length()))
				{
					temp = temp.substr(pos + 1);
					pos = temp.find("_");
					if ((pos != std::string::npos) && ((pos + 1) < temp.length()))
					{
						temp = temp.substr(pos + 1);
					}
				}
				fileName = _fltOpt.getTextureRemapPredicate() + temp;
			}
			else if (_fltOpt.getRemapTextureFilePath() == ExportOptions::GeoTypical)
			{
				std::string endFileName = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				size_t pos = endFileName.find_last_of(".");
				std::string IDirName = "";
				if (pos != std::string::npos)
				{
					IDirName = endFileName.substr(0, pos);
					endFileName = IDirName + ".rgb";
				}
				std::string C1Dir;
				std::string C2Dir;
				if (endFileName.length() > 1)
				{
					C1Dir = endFileName.substr(0, 1);
					std::transform(C1Dir.begin(), C1Dir.end(), C1Dir.begin(), ::toupper);
					C2Dir = endFileName.substr(1, 1);
					std::transform(C2Dir.begin(), C2Dir.end(), C2Dir.begin(), ::toupper);
				}
				std::string WStr = Get_CDB_Res_String(texture->getImage());
				std::string preName = "D501_S001_T001_" + WStr + "_";
				fileName = _fltOpt.getTextureRemapPredicate() + "/" + C1Dir + "/" + C2Dir + "/" + IDirName + "/" + preName + endFileName;
			}
			else if (_fltOpt.getRemapTextureFilePath() == ExportOptions::GeoTypical32)
			{
				std::string endFileName = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				size_t pos = endFileName.find_last_of(".");
				std::string IDirName = "";
				if (pos != std::string::npos)
				{
					IDirName = endFileName.substr(0, pos);
					endFileName = IDirName + ".rgb";
				}
				std::string C1Dir;
				std::string C2Dir;
				if (endFileName.length() > 1)
				{
					C1Dir = endFileName.substr(0, 1);
					std::transform(C1Dir.begin(), C1Dir.end(), C1Dir.begin(), ::toupper);
					C2Dir = endFileName.substr(1, 1);
					std::transform(C2Dir.begin(), C2Dir.end(), C2Dir.begin(), ::toupper);
				}
				std::string WStr = Get_CDB_Res_String(texture->getImage());
				std::string preName = "D511_S001_T001_" + WStr + "_";
				fileName = _fltOpt.getTextureRemapPredicate() + "/" + C1Dir + "/" + C2Dir + "/" + IDirName + "/" + preName + endFileName;
			}
			else if (_fltOpt.getRemapTextureFilePath() == ExportOptions::ToRGB)
			{
				std::string endFileName = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				size_t pos = endFileName.find_last_of(".");
				std::string IDirName = "";
				if (pos != std::string::npos)
				{
					IDirName = endFileName.substr(0, pos);
					endFileName = IDirName + ".rgb";
				}
				fileName = _fltOpt.getTextureRemapPredicate() + endFileName;
			}
			else if (_fltOpt.getRemapTextureFilePath() == ExportOptions::ToRGBwEdit)
			{
				std::string endFileName = osgDB::getSimpleFileName(texture->getImage()->getFileName());
				int count = 7;
				size_t fd = endFileName.find("_AL015_000_6_");
				if (fd != std::string::npos)
					count = 11;
				endFileName = Strip2nth("_", endFileName, count);
				fileName = _fltOpt.getTextureRemapPredicate() + endFileName;
			}

		}
        else
            fileName = texture->getImage()->getFileName();

        dos.writeInt16( (int16) TEXTURE_PALETTE_OP );
        dos.writeUInt16( 216 );
        dos.writeString( fileName, 200 );
        dos.writeInt32( index );
        dos.writeInt32( x );
        dos.writeInt32( y );
        it++;

        x += texture->getImage()->s();
        if (texture->getImage()->t() > height)
            height = texture->getImage()->t();
        if (x > 1024)
        {
            x = 0;
            y += height;
            height = 0;
        }
    }
}

std::string TexturePaletteManager::Strip2nth(std::string item, std::string path, int count) const
{
	std::string result = path;
	std::string working = path;
	int cnt = 0;
	bool done = false;
	while (!done)
	{
		size_t pos = working.find(item);
		if (pos == std::string::npos)
			break;
		if ((pos + 1) > working.length())
			break;
		working = working.substr(pos + 1);
		++cnt;
		if (cnt == count)
		{
			result = working;
			done = true;
		}
	}
	return result;
}

std::string TexturePaletteManager::Get_CDB_Res_String(const osg::Image *image) const
{
	int pixx = image->s();
	int pixy = image->t();

	int lod = 0;
	int pc = 1;
	while ((pc < pixx) && (pc < pixy))
	{
		pc *= 2;
		++lod;
	}
	if ((pc != pixx) && (pc != pixy))
		--lod;

	std::stringstream Wbuf;
	if(_fltOpt.getRemapTextureFilePath() == ExportOptions::GeoTypical32)
		Wbuf << "L" << std::setfill('0') << std::setw(2) << lod;
	else
		Wbuf << "W" << std::setfill('0') << std::setw(2) << lod;
	std::string LodStr = Wbuf.str();
	return LodStr;
}

}
