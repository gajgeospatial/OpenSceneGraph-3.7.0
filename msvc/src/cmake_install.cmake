# Install script for directory: D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/src

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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/OpenThreads/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osg/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgDB/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgUtil/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgGA/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgText/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgViewer/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgAnimation/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgFX/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgManipulator/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgParticle/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgUI/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgVolume/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgShadow/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgSim/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgTerrain/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgWidget/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgPresentation/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgWrappers/serializers/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgPlugins/cmake_install.cmake")
  INCLUDE("D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/src/osgWrappers/deprecated-dotosg/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

