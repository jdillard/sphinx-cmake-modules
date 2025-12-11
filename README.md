# Sphinx CMake Modules

A collection of reusable CMake modules for Sphinx documentation projects.

## Available Modules

### SphinxUtils.cmake

Provides utilities for integrating Sphinx documentation builds with CMake.

**Functions:**
- `setup_sphinx_environment()` - Finds the sphinx-build executable
- `add_sphinx_builder(builder_name)` - Creates a CMake target for a Sphinx builder (e.g., html, markdown, rst)

## Demo

See a working example in [sphinx-llms-txt](https://github.com/jdillard/sphinx-llms-txt/blob/main/CMakeLists.txt).

## Usage with FetchContent

> [!NOTE]
> It is recommended to use a git tag or commit hash instead of `main` for stability.

```cmake
include(FetchContent)
FetchContent_Declare(
  sphinx_cmake_modules
  GIT_REPOSITORY https://github.com/jdillard/sphinx-cmake-modules.git
  GIT_TAG        <commit-hash-or-tag>  # e.g., v0.1.0 or a specific commit hash
)
FetchContent_MakeAvailable(sphinx_cmake_modules)
list(APPEND CMAKE_MODULE_PATH "${sphinx_cmake_modules_SOURCE_DIR}")

include(SphinxUtils)
setup_sphinx_environment()
add_sphinx_builder(html)
```

