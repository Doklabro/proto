########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(cadmw-ui-ds_COMPONENT_NAMES "")
if(DEFINED cadmw-ui-ds_FIND_DEPENDENCY_NAMES)
  list(APPEND cadmw-ui-ds_FIND_DEPENDENCY_NAMES iridium Qt6)
  list(REMOVE_DUPLICATES cadmw-ui-ds_FIND_DEPENDENCY_NAMES)
else()
  set(cadmw-ui-ds_FIND_DEPENDENCY_NAMES iridium Qt6)
endif()
set(iridium_FIND_MODE "NO_MODULE")
set(Qt6_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(cadmw-ui-ds_PACKAGE_FOLDER_RELEASE "/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p")
set(cadmw-ui-ds_BUILD_MODULES_PATHS_RELEASE )


set(cadmw-ui-ds_INCLUDE_DIRS_RELEASE "${cadmw-ui-ds_PACKAGE_FOLDER_RELEASE}/include")
set(cadmw-ui-ds_RES_DIRS_RELEASE )
set(cadmw-ui-ds_DEFINITIONS_RELEASE )
set(cadmw-ui-ds_SHARED_LINK_FLAGS_RELEASE )
set(cadmw-ui-ds_EXE_LINK_FLAGS_RELEASE )
set(cadmw-ui-ds_OBJECTS_RELEASE )
set(cadmw-ui-ds_COMPILE_DEFINITIONS_RELEASE )
set(cadmw-ui-ds_COMPILE_OPTIONS_C_RELEASE )
set(cadmw-ui-ds_COMPILE_OPTIONS_CXX_RELEASE )
set(cadmw-ui-ds_LIB_DIRS_RELEASE "${cadmw-ui-ds_PACKAGE_FOLDER_RELEASE}/lib")
set(cadmw-ui-ds_BIN_DIRS_RELEASE "${cadmw-ui-ds_PACKAGE_FOLDER_RELEASE}/bin")
set(cadmw-ui-ds_LIBRARY_TYPE_RELEASE SHARED)
set(cadmw-ui-ds_IS_HOST_WINDOWS_RELEASE 0)
set(cadmw-ui-ds_LIBS_RELEASE cadmw-ui-ds)
set(cadmw-ui-ds_SYSTEM_LIBS_RELEASE )
set(cadmw-ui-ds_FRAMEWORK_DIRS_RELEASE )
set(cadmw-ui-ds_FRAMEWORKS_RELEASE )
set(cadmw-ui-ds_BUILD_DIRS_RELEASE )
set(cadmw-ui-ds_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(cadmw-ui-ds_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${cadmw-ui-ds_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${cadmw-ui-ds_COMPILE_OPTIONS_C_RELEASE}>")
set(cadmw-ui-ds_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${cadmw-ui-ds_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${cadmw-ui-ds_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${cadmw-ui-ds_EXE_LINK_FLAGS_RELEASE}>")


set(cadmw-ui-ds_COMPONENTS_RELEASE )