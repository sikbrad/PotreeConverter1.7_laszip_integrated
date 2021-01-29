cmake_minimum_required(VERSION 2.8)

project(Potree)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})


set(CMAKE_CXX_STANDARD 17)
set(LASZIP_DIR F:/Dev/Pocla/PotreeConvExperiments/PotreeConvertGit2/PotreeConverter170_laszip_integrated/ExtLibs_provisioned/LAStools/master/LASzip)
F:\Dev\Pocla\PotreeConvExperiments\PotreeConverterTest1\PotreeConverter\PotreeConverter\lib\laszip\Release
set(LASZIP_INCLUDE_DIRS ${LASZIP_DIR}/dll)
set(LASZIP_LIBRARY ${LASZIP_DIR}/build/x64/Release/laszip.lib)

#if(UNIX)
#    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=c++17 -pthread -lstdc++ -lstdc++fs -lm")
#    SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -lstdc++fs" )
#endif()

add_subdirectory(PotreeConverter)
