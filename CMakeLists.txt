# Set cmake minimum version required.
cmake_minimum_required(VERSION 4.0)

# Set the project name and project version.
#	- VERSION_MAJOR (1)
#	- VERSION_MINOR (0)
project(UNIT_TESTS
		VERSION 1.0
)

# Set C standard (optional).
set(CMAKE_C_STANDARD 11)

# "OS bitness" refers to whether your operating system (OS) is 32-bit (x86) or 64-bit (x64).
# 32-bit (x86) is mostly obsolete (only for very old hardware).
set(OSBitness 32)
# CMAKE_SIZEOF_VOID_P is a CMake variable that tells you the size of a pointer (void*) on your system.
# This helps determine if you're compiling for 32-bit or 64-bit.
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(OSBitness 64)
endif()


# Add include directory.
set( PROJECT_INCLUDES
	 ${PROJECT_SOURCE_DIR}/api
	 ${PROJECT_SOURCE_DIR}/Unity/src
)

# Add all the source files.
set( PROJECT_SOURCES
	 ${PROJECT_SOURCE_DIR}/test/Test_calculator.c
	 ${PROJECT_SOURCE_DIR}/src/calculator.c
	 ${PROJECT_SOURCE_DIR}/Unity/src/unity.c
)

# Add includes in project directory.
include_directories( ${PROJECT_INCLUDES}   # Needed to find include files '.h'.
)

#set(FullOutputDir "${CMAKE_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}${OSBitness}/${CMAKE_BUILD_TYPE}")
set(FullOutputDir "${CMAKE_SYSTEM_NAME}${OSBitness}/${CMAKE_BUILD_TYPE}")

# ARCHIVE_OUTPUT_DIRECTORY = Where static libraries (.lib/.a) go.
#	Example: bin/Windows64/Debug/static libs/
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${FullOutputDir}/static libs")

# LIBRARY_OUTPUT_DIRECTORY = Where shared libraries (.dll/.so) go.
#	Example: bin/Windows64/Debug/
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${FullOutputDir}")

# RUNTIME_OUTPUT_DIRECTORY = Where executables (.exe) go.
#	Example: bin/Windows64/Debug/
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${FullOutputDir}")


# Add executable target.
#add_executable(${PROJECT_NAME} src/main.cpp)

# OR

# Add the executable.
# It just required executable name (Which is Project name in here) and Source includes.
# Build will be created with this name (${PROJECT_NAME}).
add_executable(${PROJECT_NAME} ${PROJECT_SOURCES})

