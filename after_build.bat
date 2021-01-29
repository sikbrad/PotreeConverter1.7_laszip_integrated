@echo ON

set CURR_DIR=%cd%
mkdir output_bin

copy /Y .\cmake-build-release\PotreeConverter\PotreeConverter.exe %CURR_DIR%\output_bin\PotreeConverter.exe
copy /Y .\ExtLibs_provisioned\LAStools\master\LASzip\build\src\Release\laszip.dll %CURR_DIR%\output_bin\laszip.dll

:: recover
cd %CURR_DIR%