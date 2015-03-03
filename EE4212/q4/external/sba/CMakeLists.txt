project(SBA)
cmake_minimum_required(VERSION 2.4)

include_directories(${CMAKE_SOURCE_DIR})

find_package(LAPACK REQUIRED)

include_directories(${CMAKE_SOURCE_DIR})

add_library(sba SHARED sba_levmar.c sba_levmar_wrap.c sba_lapack.c sba_crsm.c sba_chkjac.c)

target_link_libraries(sba ${LAPACK_LIBRARIES})

install(TARGETS sba DESTINATION lib)
install(FILES sba.h sba_chkjac.h compiler.h DESTINATION include/sba)

add_subdirectory(demo)

