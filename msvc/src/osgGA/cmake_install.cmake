# Install script for directory: D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/src/osgGA

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
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgGAd.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgGA.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgGAs.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgGArd.lib")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGAd.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGA.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGAs.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGArd.dll")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGArd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgGAd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/osgGA" TYPE FILE FILES
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/AnimationPathManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/CameraViewSwitchManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/DriveManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/Device"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/Event"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/EventHandler"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/EventQueue"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/EventVisitor"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/Export"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/FirstPersonManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/FlightManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/GUIActionAdapter"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/GUIEventAdapter"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/GUIEventHandler"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/KeySwitchMatrixManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/CameraManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/MultiTouchTrackballManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/NodeTrackerManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/OrbitManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/StandardManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/SphericalManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/StateSetManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/TerrainManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/TrackballManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/UFOManipulator"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/Widget"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgGA/Version"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

