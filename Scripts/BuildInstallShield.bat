REM Step 5) Build Installshield setup.exe
REM -----------------------------
ECHO "BUILDING SETUP.EXE"
ECHO "----------------------------------"
"C:\Program Files (x86)\InstallShield\2016\System\IsCmdBld.exe" -p %1 -y %2 -e Y


REM Step 6) Moving setup.exe to desired location
REM -----------------------------
ECHO "MOVING SETUP.EXE TO DESIRED LOCATION"
ECHO "----------------------------------"

REM year:month:day:time
REM :~startingindex,length substring synxtax
set dateStr=%date:~10,4%%date:~7,2%%date:~4,2%%time:~0,5%
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
echo hour=%hour%

set dateStr=%date:~10,4%%date:~7,2%%date:~4,2%%hour%%time:~3,3%
SET installerFolderName=%dateStr::=%


REM CD to builds folder to make build folder

pushd %4

mkdir %installerFolderName%

REM Grabing installer and copying to build folder based on datetime stamp naming convention to organize executable versions
popd %4

cd %3
copy "Hydra.exe" %4\%installerFolderName%

Pause.