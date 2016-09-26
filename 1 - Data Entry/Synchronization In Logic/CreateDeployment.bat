setlocal


REM Find CSEntry.exe (path differs on 32 and 64 bit Windows)

SET CSEntry="%ProgramFiles(x86)%\CSPro 7.0\CSEntry.exe"
if exist %CSEntry% goto :gotcspro
SET CSEntry="%ProgramFiles%\CSPro 7.0\CSEntry.exe"
if exist %CSEntry% goto :gotcspro
echo "Can't find CSEntry version 7.0. Is it installed?"
goto :eof
:gotcspro


REM Create deployment directory
rmdir /q /s Deployment
mkdir Deployment
cd Deployment
mkdir "Synchronization in Logic"
cd "Synchronization in Logic"
mkdir Household
mkdir Menu
mkdir Data
cd ..\..

REM Create .pen files
%CSEntry% /pen .\Menu\Menu.ent
%CSEntry% /pen .\Household\HouseholdQuestionnaire.ent

REM Copy applications to deployment
copy /y .\Menu\Menu.pen ".\Deployment\Synchronization in Logic\Menu"
copy /y .\Household\HouseholdQuestionnaire.pen ".\Deployment\Synchronization in Logic\Household"
copy /y .\Menu\Menu.pff ".\Deployment\Synchronization in Logic\Menu"
copy /y .\Household\HouseholdQuestionnaire.pff ".\Deployment\Synchronization in Logic\Household"

