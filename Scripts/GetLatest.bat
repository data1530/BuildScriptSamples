REM Step 1) This script gets the latest project version from TFS:
REM -----------------------------
ECHO "GETTING LATEST VERSION FROM TFS: "
ECHO "----------------------------------"
cd "%~1\Hydra"

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\TF.exe" get "$/HYDRA/Source/%~2/Hydra" /recursive /login:clazar,staircase01 
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\TF.exe" workspaces /collection:https://clazar.visualstudio.com/Hydra/Hydra/ ;

REM Step 1A) Clean up dist folder, if exists:
set buildFolder="%~1\Hydra\dist\"
IF EXIST %buildFolder% (
	rd /s /q %buildFolder%
)

Pause. 