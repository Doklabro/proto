cmake_minimum_required(VERSION 3.25)

project(proto LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 COMPONENTS Core Widgets)
find_package(cadmw-ui-ds REQUIRED)

set(SOURCE_DIR source)
set(VIEW_DIR source/view)
set(MODEL_DIR source/model)

file(GLOB_RECURSE SOURCES
    "${SOURCE_DIR}/*.cpp"
    "${VIEW_DIR}/*.cpp"
    "${MODEL_DIR}/*.cpp"
)

file(GLOB_RECURSE HEADERS
    "${SOURCE_DIR}/*.h"
    "${VIEW_DIR}/*.h"
    "${MODEL_DIR}/*.h"
)

add_executable(${PROJECT_NAME}
    ${SOURCES}
    ${HEADERS}
)

target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
        Qt6::Core
        Qt6::Widgets
        cadmw-ui-ds::cadmw-ui-ds
)

install(TARGETS ${PROJECT_NAME} DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")

target_compile_definitions(${PROJECT_NAME} PRIVATE
    PROJECT_VERSION_MAJOR="${PROJECT_VERSION_MAJOR}"
    PROJECT_VERSION_MINOR="${PROJECT_VERSION_MINOR}"
    PROJECT_VERSION_PATCH="${PROJECT_VERSION_PATCH}"
    PROJECT_NAME="${PROJECT_NAME}"
)