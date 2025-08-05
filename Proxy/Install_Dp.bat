@echo off
echo Checking if package.json exists...

IF NOT EXIST package.json (
    echo package.json not found. Initializing with npm init -y...
    npm init -y
)

echo Running npm install...
npm install

echo Done.
cmd /k
