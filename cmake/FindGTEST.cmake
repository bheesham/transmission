if(GTEST_PREFER_STATIC_LIB)
    set(GTEST_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})
    if(WIN32)
        set(CMAKE_FIND_LIBRARY_SUFFIXES .a .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
    else()
        set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
    endif()
endif()

if(UNIX)
    find_package(PkgConfig QUIET)
    pkg_check_modules(_GTEST QUIET gtest_main)
endif()

find_path(GTEST_INCLUDE_DIR
    NAMES gtest/gtest.h
    HINTS ${_GTEST_INCLUDEDIR})

find_library(GTEST_LIBRARY
    NAMES gtest_main
    HINTS ${_GTEST_LIBDIR})

set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
set(GTEST_LIBRARIES ${GTEST_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(GTEST
    REQUIRED_VARS
        GTEST_INCLUDE_DIR
	GTEST_LIBRARY
    VERSION_VAR GTEST_VERSION)

mark_as_advanced(GTEST_INCLUDE_DIR GTEST_LIBRARY)
