@echo off

@rem this file gives a visual report of all current group policies
gpresult /h %temp%\gpresult.html /f && start %temp%\gpresult.html
