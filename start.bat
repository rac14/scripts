@echo off
chcp 65001 >nul

TITLE PowerNukkitX server software for Minecraft: Bedrock Edition

REM Check if Java is installed
java -version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Java is not installed. Please install Java 21 or higher.
    echo You can refer to the installation instructions at https://docs.powernukkitx.org/installation/windows
    pause
    exit 1
)

REM Check if powernukkitx.jar exists
IF NOT EXIST "powernukkitx.jar" (
    echo PowerNukkitX.jar not found
    echo You can download the file from https://github.com/PowerNukkitX/PowerNukkitX/releases
    pause
    exit 1
)

set JAVA_CMD="java"
set JAR_NAME="powernukkitx.jar"

%JAVA_CMD% -Dfile.encoding=UTF-8 ^
    -Djansi.passthrough=true ^
    -Dterminal.ansi=true ^
    -XX:+UseZGC ^
    -XX:+ZGenerational ^
    -XX:+UseStringDeduplication ^
    --add-opens java.base/java.lang=ALL-UNNAMED ^
    --add-opens java.base/java.io=ALL-UNNAMED ^
    --add-opens java.base/java.net=ALL-UNNAMED ^
    -jar %JAR_NAME%
