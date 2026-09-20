@echo off
:start
::Server name (This is just for the bat file)
set serverName=Bums vanilla server
::Server files location
set serverLocation="E:\DayZ_Servers\Skinny"
::Server Port
set serverPort=2302
::Server config
set serverConfig=ServerDZ.cfg
::Server profile location. logfiles are written here and mods are configured here [DEFAULT]
set serverProfile=profile
::Logical CPU cores to use (Equal or less than available)
set serverCPU=4
::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd "%serverLocation%"
:: makes the profile directory if it doesn't already exist
if not exist "%serverProfile%" ( 
mkdir %serverProfile% > nul
)

echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% -cpuCount=%serverCPU% -mod=@CF;@Community-Online-Tools;@Dabs-Framework;@DayZ-Expansion-Bundle;@DayZ-Expansion-Licensed -dologs -adminlog -netlog -freezecheck -profiles=%serverProfile% 
::Time in seconds before kill server process (14400 = 4 hours)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start