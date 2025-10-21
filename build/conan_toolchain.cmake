# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()
message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()

########## 'user_toolchain' block #############
# Include one or more CMake user toolchain from tools.cmake.cmaketoolchain:user_toolchain



########## 'generic_system' block #############
# Definition of system, platform and toolset





########## 'compilers' block #############



########## 'arch_flags' block #############
# Define C++ flags, C flags and linker flags from 'settings.arch'
message(STATUS "Conan toolchain: Defining architecture flag: -m64")
string(APPEND CONAN_CXX_FLAGS " -m64")
string(APPEND CONAN_C_FLAGS " -m64")
string(APPEND CONAN_SHARED_LINKER_FLAGS " -m64")
string(APPEND CONAN_EXE_LINKER_FLAGS " -m64")


########## 'libcxx' block #############
# Definition of libcxx from 'compiler.libcxx' setting, defining the
# right CXX_FLAGS for that libcxx



########## 'cppstd' block #############
# Define the C++ and C standards from 'compiler.cppstd' and 'compiler.cstd'

function(conan_modify_std_watch variable access value current_list_file stack)
    set(conan_watched_std_variable "17")
    if (${variable} STREQUAL "CMAKE_C_STANDARD")
        set(conan_watched_std_variable "")
    endif()
    if ("${access}" STREQUAL "MODIFIED_ACCESS" AND NOT "${value}" STREQUAL "${conan_watched_std_variable}")
        message(STATUS "Warning: Standard ${variable} value defined in conan_toolchain.cmake to ${conan_watched_std_variable} has been modified to ${value} by ${current_list_file}")
    endif()
    unset(conan_watched_std_variable)
endfunction()

message(STATUS "Conan toolchain: C++ Standard 17 with extensions ON")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
variable_watch(CMAKE_CXX_STANDARD conan_modify_std_watch)


########## 'extra_flags' block #############
# Include extra C++, C and linker flags from configuration tools.build:<type>flags
# and from CMakeToolchain.extra_<type>_flags

# Conan conf flags start: 
# Conan conf flags end


########## 'cmake_flags_init' block #############
# Define CMAKE_<XXX>_FLAGS from CONAN_<XXX>_FLAGS

foreach(config IN LISTS CMAKE_CONFIGURATION_TYPES)
    string(TOUPPER ${config} config)
    if(DEFINED CONAN_CXX_FLAGS_${config})
      string(APPEND CMAKE_CXX_FLAGS_${config}_INIT " ${CONAN_CXX_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_C_FLAGS_${config})
      string(APPEND CMAKE_C_FLAGS_${config}_INIT " ${CONAN_C_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_SHARED_LINKER_FLAGS_${config})
      string(APPEND CMAKE_SHARED_LINKER_FLAGS_${config}_INIT " ${CONAN_SHARED_LINKER_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_EXE_LINKER_FLAGS_${config})
      string(APPEND CMAKE_EXE_LINKER_FLAGS_${config}_INIT " ${CONAN_EXE_LINKER_FLAGS_${config}}")
    endif()
endforeach()

if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_OBJCXX_FLAGS)
  string(APPEND CMAKE_OBJCXX_FLAGS_INIT " ${CONAN_OBJCXX_FLAGS}")
endif()
if(DEFINED CONAN_OBJC_FLAGS)
  string(APPEND CMAKE_OBJC_FLAGS_INIT " ${CONAN_OBJC_FLAGS}")
endif()


########## 'extra_variables' block #############
# Definition of extra CMake variables from tools.cmake.cmaketoolchain:extra_variables



########## 'try_compile' block #############
# Blocks after this one will not be added when running CMake try/checks
get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()


########## 'find_paths' block #############
# Define paths to find packages, programs, libraries, etc.
if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
  message(STATUS "Conan toolchain: Including CMakeDeps generated conan_cmakedeps_paths.cmake")
  include("${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
else()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
list(PREPEND CMAKE_MODULE_PATH "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Widgets" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Gui" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/bin" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Core" "/home/admin/.conan2/p/b/opens2d56fed9f6438/p/lib/cmake")
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The explicitly defined "builddirs" of "host" context dependencies must be in PREFIX_PATH
list(PREPEND CMAKE_PREFIX_PATH "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Widgets" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Gui" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/bin" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib/cmake/Qt6Core" "/home/admin/.conan2/p/b/opens2d56fed9f6438/p/lib/cmake")
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_LIBRARY_PATH "/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p/lib" "/home/admin/.conan2/p/b/iridi0047b5067bf2f/p/lib" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/imageformats" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/platforms" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/iconengines" "/home/admin/.conan2/p/b/opens2d56fed9f6438/p/lib" "/home/admin/.conan2/p/b/doubl8db8374d66e94/p/lib" "/home/admin/.conan2/p/b/fontc22ec6af16d8df/p/lib" "/home/admin/.conan2/p/b/icu933397f8c04fb/p/lib" "/home/admin/.conan2/p/b/harfb45f75aadbd064/p/lib" "/home/admin/.conan2/p/b/freetddb0055c5c98e/p/lib" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/lib" "/home/admin/.conan2/p/b/elfute548e934b04a5/p/lib" "/home/admin/.conan2/p/b/xz_uted33eb49b24a2/p/lib" "/home/admin/.conan2/p/b/zstd3cbea84f57b40/p/lib" "/home/admin/.conan2/p/b/libmo54fb48277c04a/p/lib" "/home/admin/.conan2/p/b/libse12c27e41fa09e/p/lib" "/home/admin/.conan2/p/b/pcre235fc70b91f365/p/lib" "/home/admin/.conan2/p/b/bzip2302450f7e75f7/p/lib" "/home/admin/.conan2/p/b/libpnc0181b2839f40/p/lib" "/home/admin/.conan2/p/b/xkbco7d89c3e56022e/p/lib" "/home/admin/.conan2/p/b/wayla8db8b066e1270/p/lib" "/home/admin/.conan2/p/b/libfff3e295d44a252/p/lib" "/home/admin/.conan2/p/b/libxm9fff19ab3ebf9/p/lib" "/home/admin/.conan2/p/b/libic4ccbbdae473d2/p/lib" "/home/admin/.conan2/p/b/zlib57f6f67f57777/p/lib" "/home/admin/.conan2/p/b/expat339f533bb73c1/p/lib" "/home/admin/.conan2/p/b/brotl31e99d775620a/p/lib")
list(PREPEND CMAKE_INCLUDE_PATH "/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p/include" "/home/admin/.conan2/p/b/iridi0047b5067bf2f/p/include" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtSvgWidgets" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtOpenGLWidgets" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtPrintSupport" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtSvg" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtOpenGL" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtWidgets" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtXml" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtConcurrent" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtTest" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtSql" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtNetwork" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtGui" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/include/QtCore" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/mkspecs/linux-g++" "/home/admin/.conan2/p/b/opens2d56fed9f6438/p/include" "/home/admin/.conan2/p/b/doubl8db8374d66e94/p/include" "/home/admin/.conan2/p/b/fontc22ec6af16d8df/p/include" "/home/admin/.conan2/p/b/icu933397f8c04fb/p/include" "/home/admin/.conan2/p/b/harfb45f75aadbd064/p/include" "/home/admin/.conan2/p/b/harfb45f75aadbd064/p/include/harfbuzz" "/home/admin/.conan2/p/b/freetddb0055c5c98e/p/include" "/home/admin/.conan2/p/b/freetddb0055c5c98e/p/include/freetype2" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/include/gio-unix-2.0" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/include" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/include/glib-2.0" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/lib/glib-2.0/include" "/home/admin/.conan2/p/b/elfute548e934b04a5/p/include/elfutils" "/home/admin/.conan2/p/b/elfute548e934b04a5/p/include" "/home/admin/.conan2/p/b/xz_uted33eb49b24a2/p/include" "/home/admin/.conan2/p/b/zstd3cbea84f57b40/p/include" "/home/admin/.conan2/p/b/libmo54fb48277c04a/p/include" "/home/admin/.conan2/p/b/libmo54fb48277c04a/p/include/libmount" "/home/admin/.conan2/p/b/libse12c27e41fa09e/p/include" "/home/admin/.conan2/p/b/pcre235fc70b91f365/p/include" "/home/admin/.conan2/p/b/bzip2302450f7e75f7/p/include" "/home/admin/.conan2/p/b/libpnc0181b2839f40/p/include" "/home/admin/.conan2/p/b/xkbco7d89c3e56022e/p/include" "/home/admin/.conan2/p/b/wayla8db8b066e1270/p/include" "/home/admin/.conan2/p/b/libfff3e295d44a252/p/include" "/home/admin/.conan2/p/b/libxm9fff19ab3ebf9/p/include" "/home/admin/.conan2/p/b/libxm9fff19ab3ebf9/p/include/libxml2" "/home/admin/.conan2/p/b/libic4ccbbdae473d2/p/include" "/home/admin/.conan2/p/b/zlib57f6f67f57777/p/include" "/home/admin/.conan2/p/b/expat339f533bb73c1/p/include" "/home/admin/.conan2/p/b/brotl31e99d775620a/p/include")
set(CONAN_RUNTIME_LIB_DIRS "/home/admin/.conan2/p/b/cadmwef0d8e33f7c23/p/lib" "/home/admin/.conan2/p/b/iridi0047b5067bf2f/p/lib" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/lib" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/imageformats" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/platforms" "/home/admin/.conan2/p/b/qt71c9547cd5498/p/plugins/iconengines" "/home/admin/.conan2/p/b/opens2d56fed9f6438/p/lib" "/home/admin/.conan2/p/b/doubl8db8374d66e94/p/lib" "/home/admin/.conan2/p/b/fontc22ec6af16d8df/p/lib" "/home/admin/.conan2/p/b/icu933397f8c04fb/p/lib" "/home/admin/.conan2/p/b/harfb45f75aadbd064/p/lib" "/home/admin/.conan2/p/b/freetddb0055c5c98e/p/lib" "/home/admin/.conan2/p/b/gliba4dbc4eda8ea3/p/lib" "/home/admin/.conan2/p/b/elfute548e934b04a5/p/lib" "/home/admin/.conan2/p/b/xz_uted33eb49b24a2/p/lib" "/home/admin/.conan2/p/b/zstd3cbea84f57b40/p/lib" "/home/admin/.conan2/p/b/libmo54fb48277c04a/p/lib" "/home/admin/.conan2/p/b/libse12c27e41fa09e/p/lib" "/home/admin/.conan2/p/b/pcre235fc70b91f365/p/lib" "/home/admin/.conan2/p/b/bzip2302450f7e75f7/p/lib" "/home/admin/.conan2/p/b/libpnc0181b2839f40/p/lib" "/home/admin/.conan2/p/b/xkbco7d89c3e56022e/p/lib" "/home/admin/.conan2/p/b/wayla8db8b066e1270/p/lib" "/home/admin/.conan2/p/b/libfff3e295d44a252/p/lib" "/home/admin/.conan2/p/b/libxm9fff19ab3ebf9/p/lib" "/home/admin/.conan2/p/b/libic4ccbbdae473d2/p/lib" "/home/admin/.conan2/p/b/zlib57f6f67f57777/p/lib" "/home/admin/.conan2/p/b/expat339f533bb73c1/p/lib" "/home/admin/.conan2/p/b/brotl31e99d775620a/p/lib" )

endif()


########## 'pkg_config' block #############
# Define pkg-config from 'tools.gnu:pkg_config' executable and paths

if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR}:$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR}:")
endif()


########## 'rpath' block #############
# Defining CMAKE_SKIP_RPATH



########## 'output_dirs' block #############
# Definition of CMAKE_INSTALL_XXX folders

set(CMAKE_INSTALL_BINDIR "bin")
set(CMAKE_INSTALL_SBINDIR "bin")
set(CMAKE_INSTALL_LIBEXECDIR "bin")
set(CMAKE_INSTALL_LIBDIR "lib")
set(CMAKE_INSTALL_INCLUDEDIR "include")
set(CMAKE_INSTALL_OLDINCLUDEDIR "include")


########## 'variables' block #############
# Definition of CMake variables from CMakeToolchain.variables values

# Variables
set(PROJECT_VERSION "1.0.0" CACHE STRING "Variable PROJECT_VERSION conan-toolchain defined")
set(PROJECT_VERSION_MAJOR "1" CACHE STRING "Variable PROJECT_VERSION_MAJOR conan-toolchain defined")
set(PROJECT_VERSION_MINOR "0" CACHE STRING "Variable PROJECT_VERSION_MINOR conan-toolchain defined")
set(PROJECT_VERSION_PATCH "0" CACHE STRING "Variable PROJECT_VERSION_PATCH conan-toolchain defined")
# Variables  per configuration



########## 'preprocessor' block #############
# Preprocessor definitions from CMakeToolchain.preprocessor_definitions values

# Preprocessor definitions per configuration



if(CMAKE_POLICY_DEFAULT_CMP0091)  # Avoid unused and not-initialized warnings
endif()
