project(PotreeConverter)

set(RAPIDJSON_INCLUDE_DIR lib/rapidjson/include)
set(ARGUMENTS_INCLUDE_DIR lib/arguments)

## gq starts
set(CMAKE_CXX_STANDARD 17)
set(POTREE_PROJ_DIR F:/Dev/Pocla/PotreeConvExperiments/PotreeConvertGit2/PotreeConverter170_laszip_integrated)
set(LASZIP_DIR ${POTREE_PROJ_DIR}/ExtLibs_provisioned/LAStools/master/LASzip)

set(LASZIP_INCLUDE_DIRS ${LASZIP_DIR}/dll)
set(LASZIP_LIBRARY ${LASZIP_DIR}/build/src/Release/laszip.lib)
## gq ends

file(GLOB_RECURSE files src/*.cpp include/*.h include/*.hpp )
file(GLOB_RECURSE lib_rapidjson_files ${RAPIDJSON_INCLUDE_DIR}/* )
file(GLOB_RECURSE lib_argument_files ${ARGUMENTS_INCLUDE_DIR}/* )

include_directories(include ${LASZIP_INCLUDE_DIRS})
include_directories(include ${RAPIDJSON_INCLUDE_DIR})
include_directories(include ${ARGUMENTS_INCLUDE_DIR})

SOURCE_GROUP("Header Files\\io" FILES 
	include/BINPointReader.hpp 
	include/BINPointWriter.hpp
	include/LASPointReader.h
	include/LASPointWriter.hpp
	include/PlyPointReader.h
	include/PointReader.h
	include/PointWriter.hpp
	include/PTXPointReader.h
	include/XYZPointReader.hpp
)

SOURCE_GROUP("Source Files\\io" FILES 
	src/BINPointReader.cpp
	src/LASPointReader.cpp
	src/LASPointWriter.cpp
	src/PTXPointReader.cpp
)

SOURCE_GROUP("lib\\rapidjson" FILES ${lib_rapidjson_files})
SOURCE_GROUP("lib\\arguments" FILES ${lib_argument_files})

add_executable(PotreeConverter ${files} ${lib_rapidjson_files} ${lib_argument_files})

target_link_libraries(PotreeConverter ${LASZIP_LIBRARY})

if(UNIX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=c++14 -pthread -lstdc++ -lm")
    target_link_libraries(PotreeConverter -lstdc++fs)
endif()

install(TARGETS PotreeConverter RUNTIME DESTINATION bin/ )
