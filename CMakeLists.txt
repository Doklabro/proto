cmake_minimum_required(VERSION 3.25)

project(proto LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 COMPONENTS Core Widgets)
find_package(cadmw-ui-ds REQUIRED)


add_executable(${PROJECT_NAME}
    main.cpp
    view.cpp
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

target_compile_definitions(${PROJECT_NAME} PRIVATE
    PROJECT_VERSION_MAJOR="${PROJECT_VERSION_MAJOR}"
    PROJECT_VERSION_MINOR="${PROJECT_VERSION_MINOR}"
    PROJECT_VERSION_PATCH="${PROJECT_VERSION_PATCH}"
    PROJECT_NAME="${PROJECT_NAME}"
)