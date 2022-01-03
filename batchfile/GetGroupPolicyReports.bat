@echo off

@rem this file gives a visual report of all current group policies
gpresult /h %temp%\index.html /f && start %temp%\index.html
