@echo off

rem Global Variables
set ramAmount=4G
set javaArgs=-XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch
set forgeVersion=forge-1.16.5-36.2.2

rem Install Minecraft Forge if it isn't already installed.
if not exist .\%forgeVersion%.jar (
    java -jar %forgeVersion%-installer.jar --installServer
)

echo Starting Server... 
java -jar -Xms%ramAmount% -Xmx%ramAmount% %javaArgs% %forgeVersion%.jar nogui

rem When Server Stops
echo Press enter when finished.
pause <nul
