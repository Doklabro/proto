# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/cadmw-ui-ds-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${cadmw-ui-ds_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${cadmw-ui-ds_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET cadmw-ui-ds::cadmw-ui-ds)
    add_library(cadmw-ui-ds::cadmw-ui-ds INTERFACE IMPORTED)
    message(${cadmw-ui-ds_MESSAGE_MODE} "Conan: Target declared 'cadmw-ui-ds::cadmw-ui-ds'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/cadmw-ui-ds-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()