REM Step 2) Build HYDRA:
REM -----------------------------
ECHO "BUILDING HYDRA"
ECHO "----------------------------------"
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsMSBuildCmd.bat"
msbuild /p:Configuration=Release;Platform="x86" "%~1\Hydra\Hydra.sln" /t:Clean;Rebuild

Pause.