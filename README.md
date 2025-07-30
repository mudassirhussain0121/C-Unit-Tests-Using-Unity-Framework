# C-Unit-Tests-Using-Unity-Framework
Unit testing in C is a method of verifying that individual units of source code (typically functions) work as expected. 

## What is Unit Testing?
- Isolated testing: Testing individual components/functions in isolation.
- Automated: Tests can be run repeatedly without manual intervention.
- Fast execution: Tests should run quickly to enable frequent testing.
- Deterministic: Same inputs should always produce same outputs.

### Basic Structure of a Unit Test
- A typical unit test consists of:
	- Setup: Initialize test environment.
	- Execution: Call the function being tested.
	- Verification: Check results against expectations.
	- Teardown: Clean up test environment.

## Unity Frameworks
Unity is a lightweight unit testing framework for C (and C++). It's designed for embedded systems but works anywhere. It's simple, portable, and doesn’t need external dependencies.  
`Unity: simple, cross-platform unit testing framework`  

> **❗ Important**: Details of getting starting with Unity can be found in unity documentation, `Unity/doc/UnityGettingStartedGuide.md`.

### Overview of the Unity Folders
- `src` - This is the code you care about! This folder contains a C file and two header files.
  These three files _are_ Unity.
- `docs` - You're reading this document, so it's possible you have found your way into this folder already.
  This is where all the handy documentation can be found.
- `examples` - This contains a few examples of using Unity.
- `extras` - These are optional add ons to Unity that are not part of the core project.
  If you've reached us through James Grenning's book, you're going to want to look here.
- `test` - This is how Unity and its scripts are all tested.
  If you're just using Unity, you'll likely never need to go in here.
  If you are the lucky team member who gets to port Unity to a new toolchain, this is a good place to verify everything is configured properly.
- `auto` - Here you will find helpful Ruby scripts for simplifying your test workflow.
  They are purely optional and are not required to make use of Unity.

> **❗ Important**: The `"Unity/src"` directory contains all essential files `(unity.c, unity.h and unity_internals.h)` required for unit test compilation and execution using Unity Framework.

### How to Create A Test File
- Test files are C files.
- Most often you will create a single test file for each C module that you want to test.
- The test file should include `unity.h` and the header for your C module to be tested.
- A test file will include a `setUp()` and `tearDown()` function, which are run before and after the tests, respectively. These functions are mandatory and allow us to set up any necessary test case conditions. For this example, we can leave them empty, but they should be present in the test file.
- It’s a good practice to start test case function names with `test_`.
	- Test function take no arguments and return nothing.
	- E.g. `test_add()`
- Finally, the test file must include a `main()` function at the end to run the Unity test harness.
	- This function will call `UNITY_BEGIN()`, then `RUN_TEST` for each test, and finally `UNITY_END()`.
	- The `RUN_TEST()` macro is responsible for invoking each test function. Every individual test case must be explicitly registered with its own RUN_TEST() call to ensure proper execution.
- Basic skeleton of `Test*.c file`.

```sh
#include "unity.h"
#include "file_to_test.h"

void setUp() {
    // set stuff up here.
}

void tearDown() {
    // clean stuff up here.
}

void test_func_name() {
	// test logic here.
}

int main(void) {
    UNITY_BEGIN();
    // Add all test runs in between.
    RUN_TEST(test_func_name); 
    UNITY_END();
    return 0;
}
```

### Unity Test Framework Output Format
- Unity's test output follows this clear format:  
	- Displays each test result with `PASS` or `FAIL` status.
	- Provides a numeric summary showing:
		- Total tests executed
		- Number of failures
		- Tests ignored (not run)

```sh
file_to_test.c:10:test_func_name:PASS
----------------------
1 Tests 0 Failures 0 Ignored
OK
```

### Setup Unit Test Environment
- Download Unity framework into the root directory of the project.
	- git clone https://github.com/ThrowTheSwitch/Unity.git
- Recommended project structure.

```sh
my_project/
├── CMakeLists.txt               # Main CMake build configuration
├── build_script.sh              # Build script to build the project
├── api/                         # Public header files (interface)
│   └── hello.h                  # Header declaring public functions
├── src/                         # Implementation source files
│   └── hello.c                  # Source implementing hello.h functionality
├── test/                        # Test suite
│   └── test.c                   # Unit tests for the project
├── Unity/                       # Unity test framework files (Containing all its folders)
│   ├── src/unity.c              # Unity framework implementation
│   ├── src/unity.h              # Unity framework implementation
│   └── src/unity_internals.h    # Unity output configuration
└── build/                       # Build output directory (generated)
```

## Build Script
- It's custom created build script for the project and can be modified accordingly.
	- `build_script.sh`

```sh
mkdir build
cd build
cmake .. -G Ninja
cmake --build .
cd Windows64        # As our .exe is being created in `build/Windows64`
./UNIT_TESTS.exe
# Prevent terminal from closing
read -p "Press Enter to exit..."
```
