powershell set-executionpolicy remotesigned -scope currentuser
cd /D %~dp0
powershell .\install_other_software.ps1

pause