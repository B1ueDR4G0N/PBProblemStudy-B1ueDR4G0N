# Install script for directory: /home/bluedragon/PBSolver/SCIP/vendor/soplex/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/bluedragon/PBSolver/SCIP/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/array.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/basevectors.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/changesoplex.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/classarray.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/classset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/clufactor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/clufactor.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/clufactor_rational.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/clufactor_rational.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/cring.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/dataarray.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/datahashtable.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/datakey.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/dataset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/didxset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/dsvector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/dsvectorbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/dvector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/enter.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/exceptions.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/fmt.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/idlist.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/idxset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/islist.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/leave.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lpcol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lpcolbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lpcolset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lpcolsetbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lprow.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lprowbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lprowset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/lprowsetbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/mpsinput.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/nameset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/notimer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/random.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/rational.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/ratrecon.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/ratrecon.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slinsolver.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slinsolver_rational.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slufactor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slufactor.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slufactor_rational.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/slufactor_rational.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/solbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/solverational.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/solvereal.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/sorter.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxalloc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxautopr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxautopr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxbasis.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxbasis.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxboundflippingrt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxboundflippingrt.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxbounds.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxchangebasis.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdantzigpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdantzigpr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdefaultrt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdefaultrt.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdefines.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdefines.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdesc.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdevexpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxdevexpr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxequilisc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxequilisc.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxfastrt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxfastrt.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxfileio.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxfileio.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxgeometsc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxgeometsc.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxgithash.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxharrisrt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxharrisrt.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxhybridpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxhybridpr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxid.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxleastsqsc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxleastsqsc.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxlpbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxlpbase_rational.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxlpbase_real.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxmainsm.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxmainsm.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxout.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxpapilo.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxparmultpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxparmultpr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxpricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxquality.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxratiotester.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxscaler.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxscaler.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxshift.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsimplifier.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsolve.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsolver.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsolver.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxstarter.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxstarter.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsteepexpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsteeppr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsteeppr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsumst.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxsumst.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxvecs.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxvectorst.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxvectorst.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxweightpr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxweightpr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxweightst.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxweightst.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/spxwritestate.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/ssvector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/ssvectorbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/stablesum.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/statistics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/statistics.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/svector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/svectorbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/svset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/svsetbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/testsoplex.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/timer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/timerfactory.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/unitvector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/unitvectorbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/updatevector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/updatevector.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/usertimer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/validation.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/validation.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/vector.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/vectorbase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/wallclocktimer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex_interface.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/soplex/config.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex_interface.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex/external/fmt" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/chrono.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/color.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/compile.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/core.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/format-inl.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/format.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/locale.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/os.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/ostream.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/posix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/printf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/fmt/ranges.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soplex/external/zstr" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/zstr/zstr.hpp"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex/src/soplex/external/zstr/strict_fstream.hpp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex"
         RPATH "/home/bluedragon/PBSolver/SCIP/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/bin/soplex")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex"
         OLD_RPATH "::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/bluedragon/PBSolver/SCIP/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/soplex")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/lib/libsoplex.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/lib/libsoplex-pic.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1.6.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/lib/libsoplexshared.so.7.1.6.0"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/lib/libsoplexshared.so.7.1"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1.6.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsoplexshared.so.7.1"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/lib/libsoplexshared.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake"
         "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex/soplex-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/src/CMakeFiles/Export/7b30a661feffd7bbb1d77d2bef836267/soplex-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/soplex" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/CMakeFiles/soplex-config.cmake"
    "/home/bluedragon/PBSolver/SCIP/vendor/soplex-build/soplex-config-version.cmake"
    )
endif()

