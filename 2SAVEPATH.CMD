@ECHO OFF

REM This file is in UTF-8. Make it consistent to avoid code page issues.
CHCP 65001 1>NUL

REM Echo the default save path of the game like this,
REM **without** the backslash at the end,
REM which will be linked to .\SAVES
REM You can use environment variables to make this more dynamic (just like the example below).
ECHO %USERPROFILE%\AppData\Roaming\YuzuSoft\RiddleJoker