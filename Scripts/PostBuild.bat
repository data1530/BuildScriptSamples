REM Step 3) PostBuild --> Copying over static files not created via MSBuild to release folder:
REM -----------------------------
cd "%~1\Hydra\StaticFiles"
xcopy eula.txt "%~1\Hydra\dist\Release" /z /i /y
xcopy hydra.ico "%~1\Hydra\dist\Release" /z /i /y
xcopy manual.PDF "%~1\Hydra\dist\Release" /z /i /y


REM Step 4) PostBuild --> Copy release binaries into a final centralized folder, clean up if it exists from previous build/deployments

IF EXIST "%~2\FinalBuildFiles" (
	rd /s /q "%~2\FinalBuildFiles" 
)
mkdir "%~2\FinalBuildFiles"
xcopy /S /I /E /Y "%~2\Hydra\dist\Release" "%~2\FinalBuildFiles"


Pause.