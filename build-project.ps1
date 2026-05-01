$MavenVersion = "3.9.15"
$MavenDir = "$PWD\.maven"
$ZipFile = "$MavenDir\maven.zip"

if (!(Test-Path $MavenDir)) { New-Item -ItemType Directory -Path $MavenDir }

Write-Host "Step 1: Downloading Apache Maven $MavenVersion..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri "https://archive.apache.org/dist/maven/maven-3/$MavenVersion/binaries/apache-maven-$MavenVersion-bin.zip" -OutFile $ZipFile -ErrorAction Stop
} catch {
    Write-Host "Download failed. Please check your internet connection." -ForegroundColor Red
    return
}

Write-Host "Step 2: Extracting Maven..." -ForegroundColor Cyan
Expand-Archive -Path $ZipFile -DestinationPath $MavenDir -Force

$MvnCmd = Get-ChildItem -Path "$MavenDir\apache-maven-*\bin\mvn.cmd" | Select-Object -First 1

if ($MvnCmd) {
    Write-Host "Step 3: Maven ready. Installing dependencies and building project..." -ForegroundColor Green
    & $MvnCmd.FullName clean install
} else {
    Write-Host "Error: Could not find mvn.cmd after extraction." -ForegroundColor Red
}