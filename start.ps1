[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Check if Java is installed
if (-not (Get-Command java -ErrorAction SilentlyContinue)) {
    Write-Host "Java is not installed. Please install Java 21 or higher."
    Write-Host "You can refer to the installation instructions at https://docs.powernukkitx.org/installation/windows"
    exit 1
}

# Check if powernukkitx.jar exists
if (-not (Test-Path -Path "powernukkitx.jar")) {
    Write-Host "PowerNukkitX.jar not found"
    Write-Host "You can download the file from https://github.com/PowerNukkitX/PowerNukkitX/releases"
    exit 1
}

$JAVA_CMD = "java"
$JAR_NAME = "powernukkitx.jar"

& $JAVA_CMD -Dfile.encoding=UTF-8 `
    -Djansi.passthrough=true `
    -Dterminal.ansi=true `
    -XX:+UseZGC `
    -XX:+ZGenerational `
    -XX:+UseStringDeduplication `
    --add-opens java.base/java.lang=ALL-UNNAMED `
    --add-opens java.base/java.io=ALL-UNNAMED `
    --add-opens java.base/java.net=ALL-UNNAMED `
    -jar $JAR_NAME