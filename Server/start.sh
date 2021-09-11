#!/bin/sh

## Global Variables
ramAmount="4G"
javaArgs="-XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch"
forgeVersion="forge-1.16.5-36.2.2"

## Install Minecraft Forge if it isn't already installed.
forge=./${forgeVersion}.jar
[ ! -f "${forge}" ] && java -jar ./${forgeVersion}-installer.jar --installServer

## Starting the server
echo "Starting Server..."; java -jar -Xms${ramAmount} -Xmx${ramAmount} ${javaArgs} ${forge} nogui

## When Server Stops
read -p "Press enter when finished."