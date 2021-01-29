@echo ON
:: clone Lastools
REM mkdir ExtLibs
REM git clone https://github.com/LAStools/LAStools ./ExtLibs/LAStools

set CURR_DIR=%cd%
set EXTLIB_NAME=ExtLibs_auto

mkdir %CURR_DIR%\%EXTLIB_NAME%
mkdir %CURR_DIR%\%EXTLIB_NAME%\LAStools

:: build lastools (or do it in clion)
cd %CURR_DIR%\%EXTLIB_NAME%\LAStools
git clone https://github.com/LAStools/LAStools master
cd master/LASzip
mkdir build
cd build
cmake ../

:: build lastools (or do it in clion)
:: make sure you've got these environment variables set with your directory structure
set LASZIP_INCLUDE_DIRS=%CURR_DIR%\%EXTLIB_NAME%\LAStools\master\LASzip\dll
set LASZIP_LIBRARY=%CURR_DIR%\%EXTLIB_NAME%\LAStools\master\LASzip\build\src\Release\laszip.lib

:: checkout PotreeConverter
cd %CURR_DIR%
mkdir build
cd build

:: Visual Studio project
cmake -DLASZIP_INCLUDE_DIRS=%LASZIP_INCLUDE_DIRS% -DLASZIP_LIBRARY=%LASZIP_LIBRARY%  ../

REM # copy ./PotreeConverter/resources/page_template to your binary working directory.


:: recover
cd %CURR_DIR%