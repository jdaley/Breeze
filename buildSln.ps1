#msbuild.exe "R:\Source\Foo.sln" /t:build /p:Configuration=Debug `
#    /v:detailed 2>&1 | Out-String -stream -width 1024 > $DebugBuildLogFile

$solutionFileName = "Breeze.Build.sln"

# srcDir is the location of this script file
$srcDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$msBuild = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
cd $srcDir

# create the build command and invoke it 
# note that if you want to debug, remove the "/noconsolelogger" 
# from the $options string
$options = "/noconsolelogger /p:Configuration=Release"

$clean = $msbuild + " `"$solutionFileName`" " + $options + " /t:Clean"
$build = $msbuild + " `"$solutionFileName`" " + $options + " /t:Build"
Invoke-Expression $clean
Invoke-Expression $build    