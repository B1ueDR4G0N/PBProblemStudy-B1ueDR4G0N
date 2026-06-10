cmake_minimum_required(VERSION 3.16)
project(pb_scip_solver LANGUAGES CXX)

list(PREPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_SOURCE_DIR}/local")
find_package(SCIP CONFIG REQUIRED)

add_executable(pb_scip pb_scip.cpp)
target_compile_features(pb_scip PRIVATE cxx_std_17)

if(TARGET SCIP::libscip)
  target_link_libraries(pb_scip PRIVATE SCIP::libscip)
elseif(TARGET libscip)
  target_link_libraries(pb_scip PRIVATE libscip)
else()
  target_include_directories(pb_scip PRIVATE ${SCIP_INCLUDE_DIRS})
  target_link_libraries(pb_scip PRIVATE ${SCIP_LIBRARIES})
endif()
