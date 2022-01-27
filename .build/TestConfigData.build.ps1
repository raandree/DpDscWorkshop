param
(
    # Project path
    [Parameter()]
    [System.String]
    $ProjectPath = (property ProjectPath $BuildRoot),

    [Parameter()]
    # Base directory of all output (default to 'output')
    [System.String]
    $OutputDirectory = (property OutputDirectory (Join-Path $BuildRoot 'output')),

    [Parameter()]
    [System.String]
    $PesterOutputFolder = (property PesterOutputFolder 'TestResults'),

    [Parameter()]
    [System.String]
    $PesterOutputFormat = (property PesterOutputFormat ''),

    [Parameter()]
    [System.Object[]]
    $PesterScript = (property PesterScript ''),

    [Parameter()]
    [System.Object[]]
    $ConfigDataPesterScript = (property ConfigDataPesterScript 'ConfigData'),

    [Parameter()]
    [int]
    $CurrentJobNumber = (property CurrentJobNumber 1),

    [Parameter()]
    [int]
    $TotalJobCount = (property TotalJobCount 1),

    # Build Configuration object
    [Parameter()]
    [System.Collections.Hashtable]
    $BuildInfo = (property BuildInfo @{ })
)

task TestConfigData {

    $isWrongPesterVersion = (Get-Module -Name 'Pester').Version -lt [System.Version] '5.0.0'

    # If the correct module is not imported, then exit.
    if ($isWrongPesterVersion)
    {
        "Pester 5 is not used in the pipeline, skipping task.`n"

        return
    }

    . Set-SamplerTaskVariable

    $PesterOutputFolder = Get-SamplerAbsolutePath -Path $PesterOutputFolder -RelativeTo $OutputDirectory
    "`tPester Output Folder    = '$PesterOutputFolder"
    if (-not (Test-Path -Path $PesterOutputFolder))
    {
        Write-Build -Color 'Yellow' -Text "Creating folder $PesterOutputFolder"

        $null = New-Item -Path $PesterOutputFolder -ItemType 'Directory' -Force -ErrorAction 'Stop'
    }

    $osShortName = Get-OperatingSystemShortName

    $powerShellVersion = 'PSv.{0}' -f $PSVersionTable.PSVersion

    $getPesterOutputFileFileNameParameters = @{
        ProjectName       = $ProjectName
        ModuleVersion     = $ModuleVersion
        OsShortName       = $osShortName
        PowerShellVersion = $powerShellVersion
    }

    $pesterOutputFileFileName = Get-PesterOutputFileFileName @getPesterOutputFileFileNameParameters

    $pesterOutputFullPath = Get-SamplerAbsolutePath -Path "$($PesterOutputFormat)_$pesterOutputFileFileName" -RelativeTo $PesterOutputFolder



    $OutputDirectory = Get-SamplerAbsolutePath -Path $OutputDirectory -RelativeTo $ProjectPath
    $PesterScript = $PesterScript.Foreach( {
            Get-SamplerAbsolutePath -Path $_ -RelativeTo $ProjectPath
        })

    $ConfigDataPesterScript = $ConfigDataPesterScript.Foreach( {
            Get-SamplerAbsolutePath -Path $_ -RelativeTo $PesterScript[0]
        })

    Write-Build Green "Config Data Pester Scripts = [$($ConfigDataPesterScript -join ';')]"

    if (-not (Test-Path -Path $ConfigDataPesterScript))
    {
        Write-Build Yellow "Path for tests '$ConfigDataPesterScript' does not exist"
        return
    }

    $testResultsPath = Get-SamplerAbsolutePath -Path IntegrationTestResults.xml -RelativeTo $OutputDirectory

    Write-Build DarkGray "TestResultsPath is: $TestResultsPath"
    Write-Build DarkGray "OutputDirectory is: $OutputDirectory"

    Import-Module -Name Pester
    $po = New-PesterConfiguration
    $po.Run.PassThru = $true
    $po.Run.Path = [string[]]$ConfigDataPesterScript
    $po.Output.Verbosity = 'Detailed'
    $po.Filter.Tag = 'Integration'
    $po.TestResult.Enabled = $true
    $po.TestResult.OutputFormat = 'NUnitXml'
    $po.TestResult.OutputPath = $testResultsPath
    $testResults = Invoke-Pester -Configuration $po

    assert ($testResults.FailedCount -eq 0 -and $testResults.FailedBlocksCount -eq 0 -and $testResults.FailedContainersCount -eq 0)
}
