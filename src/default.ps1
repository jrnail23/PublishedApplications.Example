FormatTaskName (("-"*25) + "[{0}]" + ("-"*25))

Task Default -depends  BuildLibraryA, BuildLibraryC

Task Clean -maxRetries 10 {
    if (Test-Path .\buildOutput) 
	{	
        Write-Host "Deleting buildOutput directory" -ForegroundColor Cyan
		rd .\buildOutput -rec -force | out-null
	}
}

Task BuildLibraryA -depends Clean {
    Write-Host "building LibraryA via its project file, which does not use PublishedApplications" -ForegroundColor Cyan
    msbuild .\LibraryA\LibraryA.csproj /verbosity:quiet /p:OutDir=..\buildOutput\libA /nologo
} -postcondition { 
    Write-Host "Asserting that 'Copy to Output Directory' content (contained in a folder) from referenced assembly gets written to that folder under the output directory"
    Test-Path .\buildOutput\libA\MyStuff\MyTextFile.txt 
}

Task BuildLibraryC -depends Clean {
    msbuild .\LibraryC\LibraryC.csproj /verbosity:quiet /p:OutDir=..\buildOutput\libC /nologo
} -postcondition { 
    Write-Host "Asserting that 'Copy to Output Directory' content (contained in a folder) from referenced assembly gets written to that folder under the output directory"
    Test-Path .\buildOutput\libC\_PublishedApplications\LibraryC\MyStuff\MyTextFile.txt
}