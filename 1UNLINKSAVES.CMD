@ECHO OFF

REM This file is in UTF-8. Make it consistent to avoid code page issues.
CHCP 65001 1>NUL

REM The batch file that echos save path. We read default save path from there.
SET SAVEPATHFILE="%~DP02SAVEPATH.CMD"

IF NOT EXIST %SAVEPATHFILE% (
	ECHO  %SAVEPATHFILE% does not exist! 1>&2
	EXIT /B 1
)

REM Read save path from the batch file mentioned above.
FOR /F "tokens=* USEBACKQ" %%F IN (`%SAVEPATHFILE%`) DO (
	SET SAVEPATH=%%F
)

REM Remove the default save path (unlink).
RMDIR /S /Q "%SAVEPATH%"  || GOTO :ERROR

ECHO Operation completed successfully.
PING 127.0.0.1 -n 2 2>&1 1>NUL
EXIT /B 0

:ERROR
ECHO Sorry, something went wrong. 1>&2
ECHO Try running this script as administrator. 1>&2
PAUSE
EXIT /B 1