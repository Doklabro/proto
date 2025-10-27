########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(iridium_COMPONENT_NAMES "")
if(DEFINED iridium_FIND_DEPENDENCY_NAMES)
  list(APPEND iridium_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES iridium_FIND_DEPENDENCY_NAMES)
else()
  set(iridium_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(iridium_PACKAGE_FOLDER_RELEASE "/home/admin/.conan2/p/b/iridi0047b5067bf2f/p")
set(iridium_BUILD_MODULES_PATHS_RELEASE )


set(iridium_INCLUDE_DIRS_RELEASE )
set(iridium_RES_DIRS_RELEASE )
set(iridium_DEFINITIONS_RELEASE )
set(iridium_SHARED_LINK_FLAGS_RELEASE )
set(iridium_EXE_LINK_FLAGS_RELEASE )
set(iridium_OBJECTS_RELEASE )
set(iridium_COMPILE_DEFINITIONS_RELEASE )
set(iridium_COMPILE_OPTIONS_C_RELEASE )
set(iridium_COMPILE_OPTIONS_CXX_RELEASE )
set(iridium_LIB_DIRS_RELEASE "${iridium_PACKAGE_FOLDER_RELEASE}/lib")
set(iridium_BIN_DIRS_RELEASE "${iridium_PACKAGE_FOLDER_RELEASE}/bin")
set(iridium_LIBRARY_TYPE_RELEASE SHARED)
set(iridium_IS_HOST_WINDOWS_RELEASE 0)
set(iridium_LIBS_RELEASE )
set(iridium_SYSTEM_LIBS_RELEASE )
set(iridium_FRAMEWORK_DIRS_RELEASE )
set(iridium_FRAMEWORKS_RELEASE )
set(iridium_BUILD_DIRS_RELEASE )
set(iridium_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(iridium_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${iridium_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${iridium_COMPILE_OPTIONS_C_RELEASE}>")
set(iridium_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${iridium_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${iridium_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${iridium_EXE_LINK_FLAGS_RELEASE}>")


set(iridium_COMPONENTS_RELEASE )