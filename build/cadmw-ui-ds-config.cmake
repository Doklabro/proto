########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(cadmw-ui-ds_FIND_QUIETLY)
    set(cadmw-ui-ds_MESSAGE_MODE VERBOSE)
else()
    set(cadmw-ui-ds_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cadmw-ui-dsTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${cadmw-ui-ds_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(cadmw-ui-ds_VERSION_STRING "0.4.0")
set(cadmw-ui-ds_INCLUDE_DIRS ${cadmw-ui-ds_INCLUDE_DIRS_RELEASE} )
set(cadmw-ui-ds_INCLUDE_DIR ${cadmw-ui-ds_INCLUDE_DIRS_RELEASE} )
set(cadmw-ui-ds_LIBRARIES ${cadmw-ui-ds_LIBRARIES_RELEASE} )
set(cadmw-ui-ds_DEFINITIONS ${cadmw-ui-ds_DEFINITIONS_RELEASE} )


# Definition of extra CMake variables from cmake_extra_variables


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${cadmw-ui-ds_BUILD_MODULES_PATHS_RELEASE} )
    message(${cadmw-ui-ds_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


