@echo off

@rem this file gives a visual report of all current group policies
gpresult /h index.html && start index.html
