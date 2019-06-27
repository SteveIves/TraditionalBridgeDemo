@echo off
setlocal
pushd %~dp0

call "%SYNERGYDE32%dbl\dblvars32.bat"

rem Create an FTP command script to transfer the files
echo Creating FTP script...
echo open SIUBUNTU 21> ftp.tmp
echo bridge>> ftp.tmp
echo bridge>> ftp.tmp
echo ascii>> ftp.tmp
echo prompt>> ftp.tmp
echo cd Dispatchers>> ftp.tmp
echo mput TraditionalBridge\Dispatchers\*.dbl>> ftp.tmp
echo cd ../ExposedRoutines>> ftp.tmp
echo mput TraditionalBridge\ExposedRoutines\*.dbl>> ftp.tmp
echo cd ../LibraryCode>> ftp.tmp
echo mput TraditionalBridge\LibraryCode\*.dbl>> ftp.tmp
echo cd ..>> ftp.tmp
echo mput TraditionalBridge\*.dbl>> ftp.tmp
echo mput TraditionalBridge\LINUX\*>> ftp.tmp
echo bye>> ftp.tmp

 rem Transfer the files
echo Transferring files...
ftp -s:ftp.tmp 1>nul

rem Delete the command script
echo Cleaning up...
del /q ftp.tmp

echo Done!
popd
endlocal