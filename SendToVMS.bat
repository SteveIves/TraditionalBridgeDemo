@echo off
setlocal
pushd %~dp0

call "%SYNERGYDE32%dbl\dblvars32.bat"

rem Create an FTP command script to transfer the files
echo Creating FTP script...
echo open SIVMS > ftp.tmp
echo BRIDGE >> ftp.tmp
echo BRIDGE >> ftp.tmp
echo ascii >> ftp.tmp
echo prompt >> ftp.tmp
rem 
echo cd [.DISPATCHERS] >> ftp.tmp
echo mput TraditionalBridge\Dispatchers\*.dbl >> ftp.tmp
rem
echo cd [-.EXPOSEDROUTINES] >> ftp.tmp
echo mput TraditionalBridge\ExposedRoutines\*.dbl >> ftp.tmp
rem
echo cd [-.LIBRARYCODE] >> ftp.tmp
echo mput TraditionalBridge\LibraryCode\*.dbl >> ftp.tmp
rem
echo cd [-] >> ftp.tmp
echo mput TraditionalBridge\*.dbl >> ftp.tmp
echo mput TraditionalBridge\VMS\*.com >> ftp.tmp
echo bye >> ftp.tmp

rem Transfer the files
echo Transferring files...
ftp -s:ftp.tmp 1>nul

rem Delete the command script
echo Cleaning up...
del /q ftp.tmp

echo Done!
popd
endlocal