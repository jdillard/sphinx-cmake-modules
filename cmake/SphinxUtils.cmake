#[[
# @file SphinxUtils.cmake
# @brief Sphinx documentation utilities for CMake projects
#
# This module provides functions to integrate Sphinx documentation
# generation into CMake build systems. It handles finding the Sphinx
# executable and creating build targets for various output formats.
#
# @pre Sphinx (sphinx-build) must be installed and available in PATH
#]]

#[[
# @var SPHINX_SOURCE
# @brief Path to the Sphinx documentation source directory
#
# Defaults to ${CMAKE_CURRENT_SOURCE_DIR}/source
#]]
set(SPHINX_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/source)

#[[
# @var SPHINX_BUILD
# @brief Base path for Sphinx build output directories
#
# Defaults to ${CMAKE_BINARY_DIR}
#]]
set(SPHINX_BUILD ${CMAKE_BINARY_DIR})

#[[
# @brief Finds and configures the Sphinx documentation generator
#
# Searches for the sphinx-build executable in the system PATH.
# If found, exports SPHINX_EXECUTABLE to the parent scope for use
# by other functions. Raises a fatal error if Sphinx is not installed.
#
# @post SPHINX_EXECUTABLE is set to the path of sphinx-build (PARENT_SCOPE)
# @throws FATAL_ERROR if sphinx-build is not found in the system
#]]
function(setup_sphinx_environment)
    # Find sphinx-build executable in system
    find_program(SPHINX_EXECUTABLE
        NAMES sphinx-build
        DOC "Sphinx documentation generator"
    )

    if(NOT SPHINX_EXECUTABLE)
        message(FATAL_ERROR "sphinx-build not found. Please install Sphinx.")
    endif()

    # Export to parent scope
    set(SPHINX_EXECUTABLE "${SPHINX_EXECUTABLE}" PARENT_SCOPE)
endfunction()

#[[
# @brief Creates a custom CMake target for a Sphinx documentation builder
#
# Adds a custom target that invokes sphinx-build with the specified builder type.
# The target will build documentation from SPHINX_SOURCE to SPHINX_BUILD/<builder_name>.
# Common builder types include: html, dirhtml, singlehtml, latex, epub, man, texinfo.
#
# @param builder_name The Sphinx builder type (e.g., "html", "dirhtml", "man")
#
# @post A CMake target named @p builder_name is created that runs sphinx-build
#
# @par Example
# @code
# add_sphinx_builder(html)      # Creates target: html
# add_sphinx_builder(dirhtml)   # Creates target: dirhtml
# @endcode
#]]
function(add_sphinx_builder builder_name)
    add_custom_target(${builder_name}
        COMMAND ${SPHINX_EXECUTABLE} -b ${builder_name} ${SPHINX_SOURCE} ${SPHINX_BUILD}/${builder_name}
        VERBATIM
    )
endfunction()
