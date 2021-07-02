@echo off

@rem this file simply broadcasts the latest changes in an active-directory
@rem it syncs also the changes from one dc to the other availables
Repadmin.exe /Syncall /AdeP
