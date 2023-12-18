@echo off

@REM Notepad++/VSCODE needs current working directory to be where Caprica.exe is 
cd "C:\Repositories\Public\Starfield Mods\starfield-cora-the-book-hunter\Tools"

@echo "Deploying Main Archive to MO2 Mod DIR"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-cora-the-book-hunter\Dist\CoraTheBookHunter - Main.ba2" "D:\MO2Staging\Starfield\mods\CoraTheBookHunter-Experimental"
