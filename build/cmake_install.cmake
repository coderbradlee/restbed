# Install script for directory: /root/restbed

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/restbed/distribution")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/root/restbed/source/restbed")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/corvusoft/restbed" TYPE FILE FILES
    "/root/restbed/source/corvusoft/restbed/http.hpp"
    "/root/restbed/source/corvusoft/restbed/rule.hpp"
    "/root/restbed/source/corvusoft/restbed/settings.hpp"
    "/root/restbed/source/corvusoft/restbed/ssl_settings.hpp"
    "/root/restbed/source/corvusoft/restbed/status_code.hpp"
    "/root/restbed/source/corvusoft/restbed/resource.hpp"
    "/root/restbed/source/corvusoft/restbed/request.hpp"
    "/root/restbed/source/corvusoft/restbed/response.hpp"
    "/root/restbed/source/corvusoft/restbed/byte.hpp"
    "/root/restbed/source/corvusoft/restbed/uri.hpp"
    "/root/restbed/source/corvusoft/restbed/string.hpp"
    "/root/restbed/source/corvusoft/restbed/logger.hpp"
    "/root/restbed/source/corvusoft/restbed/service.hpp"
    "/root/restbed/source/corvusoft/restbed/session.hpp"
    "/root/restbed/source/corvusoft/restbed/session_manager.hpp"
    "/root/restbed/source/corvusoft/restbed/context_value.hpp"
    "/root/restbed/source/corvusoft/restbed/context_placeholder.hpp"
    "/root/restbed/source/corvusoft/restbed/context_placeholder_base.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "library")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/library" TYPE STATIC_LIBRARY FILES "/root/restbed/build/librestbed.a")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/root/restbed/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
