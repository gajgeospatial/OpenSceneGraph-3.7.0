# Install script for directory: D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/src/osgShadow

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
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgShadowd.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgShadow.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgShadows.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/lib/osgShadowrd.lib")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadowd.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadow.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadows.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadowrd.dll")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadowrd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE FILES "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/msvc/bin/osg158-osgShadowd.pdb")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/osgShadow" TYPE FILE FILES
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/Export"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ShadowTechnique"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ShadowTexture"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ShadowedScene"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ShadowSettings"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/SoftShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ParallelSplitShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/Version"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ConvexPolyhedron"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/DebugShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/LightSpacePerspectiveShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/MinimalCullBoundsShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/MinimalDrawBoundsShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/MinimalShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ProjectionShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/StandardShadowMap"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ViewDependentShadowTechnique"
    "D:/Development/op3d_active/OpenSceneGraph-OpenSceneGraph-3.6.3/include/osgShadow/ViewDependentShadowMap"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "libopenscenegraph-dev")

