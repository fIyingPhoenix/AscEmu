# Copyright (c) 2014-2022 AscEmu Team <http://www.ascemu.org>

# get architecture type and set architecture identifier
if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(IS_64BIT TRUE)
    set(AE_ARCHITECTURE "x64 (${CMAKE_SYSTEM_PROCESSOR})")
    message(STATUS "Detected system: ${CMAKE_SYSTEM_NAME} ${CMAKE_GENERATOR_PLATFORM} (${CMAKE_SYSTEM_PROCESSOR})")
else ()
    set(IS_64BIT FALSE)
    set(AE_ARCHITECTURE "x84 (${CMAKE_SYSTEM_PROCESSOR})")
    message(STATUS "Detected system: ${CMAKE_SYSTEM_NAME} ${CMAKE_GENERATOR_PLATFORM} (${CMAKE_SYSTEM_PROCESSOR})")
endif ()

# let know the system name
if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(AE_PLATFORM "Linux")
    include(${CMAKE_SOURCE_DIR}/cmake/Systems/Linux.cmake)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(AE_PLATFORM "macOS")
    include(${CMAKE_SOURCE_DIR}/cmake/Systems/Apple.cmake)
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(AE_PLATFORM "Windows")
    include(${CMAKE_SOURCE_DIR}/cmake/Systems/Windows.cmake)
elseif (CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" OR CMAKE_SYSTEM_NAME STREQUAL "kFreeBSD")
    set(AE_PLATFORM "FreeBSD")
    include(${CMAKE_SOURCE_DIR}/cmake/Systems/FreeBSD.cmake)
else ()
    message(FATAL_ERROR "System is not supported." )
endif ()