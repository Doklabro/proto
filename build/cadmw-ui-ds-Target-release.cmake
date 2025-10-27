# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(cadmw-ui-ds_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(cadmw-ui-ds_FRAMEWORKS_FOUND_RELEASE "${cadmw-ui-ds_FRAMEWORKS_RELEASE}" "${cadmw-ui-ds_FRAMEWORK_DIRS_RELEASE}")

set(cadmw-ui-ds_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET cadmw-ui-ds_DEPS_TARGET)
    add_library(cadmw-ui-ds_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET cadmw-ui-ds_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${cadmw-ui-ds_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${cadmw-ui-ds_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:iridium::iridium;qt::qt>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### cadmw-ui-ds_DEPS_TARGET to all of them
conan_package_library_targets("${cadmw-ui-ds_LIBS_RELEASE}"    # libraries
                              "${cadmw-ui-ds_LIB_DIRS_RELEASE}" # package_libdir
                              "${cadmw-ui-ds_BIN_DIRS_RELEASE}" # package_bindir
                              "${cadmw-ui-ds_LIBRARY_TYPE_RELEASE}"
                              "${cadmw-ui-ds_IS_HOST_WINDOWS_RELEASE}"
                              cadmw-ui-ds_DEPS_TARGET
                              cadmw-ui-ds_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "cadmw-ui-ds"    # package_name
                              "${cadmw-ui-ds_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${cadmw-ui-ds_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${cadmw-ui-ds_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${cadmw-ui-ds_LIBRARIES_TARGETS}>
                 )

    if("${cadmw-ui-ds_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     cadmw-ui-ds_DEPS_TARGET)
    endif()

    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${cadmw-ui-ds_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${cadmw-ui-ds_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${cadmw-ui-ds_LIB_DIRS_RELEASE}>)
    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${cadmw-ui-ds_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET cadmw-ui-ds::cadmw-ui-ds
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${cadmw-ui-ds_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(cadmw-ui-ds_LIBRARIES_RELEASE cadmw-ui-ds::cadmw-ui-ds)
