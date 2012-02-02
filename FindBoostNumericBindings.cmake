##############################################################################
# @file  FindBoostNumericBindings.cmake
# @brief Find Boost Numeric Bindings package.
#
# This module looks for an installation of the Boost Numeric Bindings package,
# a bindings library for Boost.Ublas
# (see http://mathema.tician.de/software/boost-numeric-bindings). Note that
# you will also need Boost.Ublas in order to use this headers-only library.
#
# @par Input variables:
# <table border="0">
#   <tr>
#     @tp @b BoostNumericBindings_DIR @endtp
#     <td>The Boost Numeric Bindings package files are searched under the
#         specified root directory. This variable can also be set as environment
#         variable.</td>
#   </tr>
#   <tr>
#     @tp @b BOOSTNUMERICBINDINGS_DIR @endtp
#     <td>Alternative environment variable for @p BoostNumericBindings_DIR.</td>
#   </tr>
# </table>
#
# @par Output variables:
# <table border="0">
#   <tr>
#     @tp @b BoostNumericBindings_FOUND @endtp
#     <td>Whether the Boost Numeric Bindings package was found and the following
#         CMake variables are valid.</td>
#   </tr>
#   <tr>
#     @tp @b BoostNumericBindings_INCLUDE_DIR @endtp
#     <td>Cached include directory/ies.</td>
#   </tr>
#   <tr>
#     @tp @b BoostNumericBindings_INCLUDE_DIRS @endtp
#     <td>Alias for @p BoostNumericBindings_INCLUDE_DIR (not cached).</td>
#   </tr>
#   <tr>
#     @tp @b BoostNumericBindings_INCLUDES @endtp
#     <td>Alias for @p BoostNumericBindings_INCLUDE_DIR (not cached).</td>
#   </tr>
# </table>
#
# Copyright (c) 2012 University of Pennsylvania. All rights reserved.
# See http://www.rad.upenn.edu/sbia/software/license.html or COPYING file.
#
# Contact: SBIA Group <sbia-software at uphs.upenn.edu>
#
# @ingroup CMakeFindModules
##############################################################################

# ----------------------------------------------------------------------------
# initialize search
if (NOT BoostNumericBindings_DIR)
  if (NOT "$ENV{BOOSTNUMERICBINDINGS_DIR}" STREQUAL "")
    set (
      BoostNumericBindings_DIR
        "$ENV{BOOSTNUMERICBINDINGS_DIR}"
      CACHE PATH
        "Installation prefix for Boost Numeric Bindings."
      FORCE
    )
  else ()
    set (
      BoostNumericBindings_DIR
        "$ENV{BoostNumericBindings_DIR}"
      CACHE PATH
        "Installation prefix for Boost Numeric Bindings."
      FORCE
    )
  endif ()
endif ()

# ----------------------------------------------------------------------------
# find paths/files
if (BoostNumericBindings_DIR)

  find_path (
    BoostNumericBindings_INCLUDE_DIR
      NAMES         boost/numeric/bindings/atlas/cblas.hpp
      HINTS         ${BoostNumericBindings_DIR}
      DOC           "Root include directory of Boost Numeric Bindings."
      NO_DEFAULT_PATH
  )

else ()

  find_path (
    BoostNumericBindings_INCLUDE_DIR
      NAMES         boost/numeric/bindings/atlas/cblas.hpp
      HINTS         ENV C_INCLUDE_PATH ENV CXX_INCLUDE_PATH
      DOC           "Root include directory of Boost Numeric Bindings."
  )

endif ()

mark_as_advanced (BoostNumericBindings_INCLUDE_DIR)

# ----------------------------------------------------------------------------
# aliases / backwards compatibility
if (BoostNumericBindings_INCLUDE_DIR)
  set (BoostNumericBindings_INCLUDE_DIRS "${BoostNumericBindings_INCLUDE_DIR}")
  set (BoostNumericBindings_INCLUDES     "${BoostNumericBindings_INCLUDE_DIR}")
endif ()

# ----------------------------------------------------------------------------
# handle the QUIETLY and REQUIRED arguments and set *_FOUND to TRUE
# if all listed variables are found or TRUE
include (FindPackageHandleStandardArgs)

find_package_handle_standard_args (
  BoostNumericBindings
  REQUIRED_VARS
    BoostNumericBindings_INCLUDE_DIR
)

set (BoostNumericBindings_FOUND ${BOOSTNUMERICBINDINGS_FOUND})

# ----------------------------------------------------------------------------
# set BoostNumericBindings_DIR
if (NOT BoostNumericBindings_DIR AND BoostNumericBindings_FOUND)
  set (
    BoostNumericBindings_DIR
      "${BoostNumericBindings_INCLUDE_DIR}"
    CACHE PATH
      "Installation prefix for NiftiCLib."
    FORCE
  )
endif ()
