@ECHO off

:CONFIGS
SET DOWNLOAD_DIRECTORY=Downloads
SET CONFIG_DIRECTORY=configs
SET STREAMLINK=Streamlink

SET DEFAULT_COLOR=17
SET WORKING_COLOR=02
SET LEECH_WINDOW_COLOR=A

MODE con:cols=85 lines=40

:STARTUP
FOR /f %%B IN (%CONFIG_DIRECTORY%/banner) DO ( ECHO %%B )
IF NOT EXIST %DOWNLOAD_DIRECTORY% ( MKDIR %DOWNLOAD_DIRECTORY% )

:RUN
COLOR %DEFAULT_COLOR%

:STRINGS
SET STR_M3U8="* Enter the M3U8 URL: "
SET STR_REFERER="* Enter a valid referer URL: "
SET STR_FILE_NAME="* Enter file name after save: "

:INPUTS
SET /p USER_AGENT=<%CONFIG_DIRECTORY%/user-agent
SET /p M3U8_URL=%STR_M3U8%
SET /p REFERER=%STR_REFERER%
SET /p FILE_NAME=%STR_FILE_NAME%

SET DOWNLOAD_PATH=%DOWNLOAD_DIRECTORY%/%FILE_NAME%.mp4

:LEECH
SET COMMAND="%CD%/%STREAMLINK%/bin/streamlink.exe" --http-header "User-Agent=%USER_AGENT%" --http-header "Referer=%REFERER%" "hlsvariant://%M3U8_URL%" best -o "%DOWNLOAD_PATH%"

START cmd.exe  /C "MODE con:cols=80 lines=20 && COLOR %LEECH_WINDOW_COLOR% && %COMMAND%"


ECHO.
COLOR %WORKING_COLOR%

ECHO "Press any key to leech the next part"
PAUSE >nul

GOTO run
