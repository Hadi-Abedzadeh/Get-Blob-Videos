@ECHO off

:CONFIGS
COLOR 02
SET DOWNLOAD_DIRECTORY=Downloads
SET CONFIG_DIRECTORY=configs
SET STREAMLINK=Streamlink
MODE con:cols=90

:STARTUP
FOR /f %%B IN (%CONFIG_DIRECTORY%/banner) DO ( ECHO %%B )
IF NOT EXIST %DOWNLOAD_DIRECTORY% ( MKDIR %DOWNLOAD_DIRECTORY% )

:MAIN
SET /p USER_AGENT=<%CONFIG_DIRECTORY%/user-agent
SET /p M3U8_URL=" * Enter the M3U8 URL: "
SET /p REFERER="* Enter a valid referer URL: "
SET /p FILE_NAME="* Enter file name after save: "

SET DOWNLOAD_PATH=%DOWNLOAD_DIRECTORY%/%FILE_NAME%.mp4
SET COMMAND=%STREAMLINK%/bin/streamlink.exe --http-header "User-Agent=%USER_AGENT%" --http-header "Referer=%REFERER%" "hlsvariant://%M3U8_URL%" best -o "%DOWNLOAD_PATH%"

%COMMAND%

GOTO main