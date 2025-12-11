# Sphinx CMake Modules

A collection of reusable CMake modules for Sphinx documentation projects.

## Available Modules

### [SphinxUtils.cmake](cmake/modules/SphinxUtils.cmake)

Provides utilities for integrating Sphinx documentation builds with CMake.

## Usage with FetchContent

Use CMake's [FetchContent](https://cmake.org/cmake/help/latest/module/FetchContent.html) module to download and include this project in your build:

```cmake
include(FetchContent)
FetchContent_Declare(
  sphinx_cmake_modules
  GIT_REPOSITORY https://github.com/jdillard/sphinx-cmake-modules.git
  GIT_TAG        <commit-hash-or-tag>  # e.g., v0.2.0 or a specific commit hash
)
FetchContent_MakeAvailable(sphinx_cmake_modules)
list(APPEND CMAKE_MODULE_PATH "${sphinx_cmake_modules_SOURCE_DIR}/cmake/modules")

include(SphinxUtils)
setup_sphinx_environment()
add_sphinx_builder(html)
```

> [!NOTE]
> It is recommended to use a git tag or commit hash instead of `main` for stability.

## Demo

See a working example in [sphinx-llms-txt](https://github.com/jdillard/sphinx-llms-txt/blob/main/CMakeLists.txt).

