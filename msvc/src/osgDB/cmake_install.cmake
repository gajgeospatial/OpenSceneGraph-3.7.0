# Install script for directory: D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/src/osgDB

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/OpenSceneGraph")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgDBd.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgDB.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgDBs.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgDBrd.lib")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDBd.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDB.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDBs.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDBrd.dll")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDBrd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgDBd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/osgDB" TYPE FILE FILES
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/DataTypes"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/StreamOperator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Serializer"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ObjectWrapper"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/InputStream"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/OutputStream"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Archive"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/AuthenticationMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Callbacks"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ClassInterface"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ConvertBase64"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ConvertUTF"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/DatabasePager"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/DatabaseRevisions"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/DotOsgWrapper"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/DynamicLibrary"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Export"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ExternalFileWriter"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/FileCache"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/FileNameUtils"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/FileUtils"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/fstream"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ImageOptions"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ImagePager"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ImageProcessor"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Input"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ObjectCache"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Output"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Options"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ParameterOutput"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/PluginQuery"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ReaderWriter"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/ReadFile"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Registry"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/SharedStateManager"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/Version"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/WriteFile"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgDB/XmlParser"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

