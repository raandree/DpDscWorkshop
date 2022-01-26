﻿@{
    RootModule        = 'CommonTasks.psm1'
    ModuleVersion     = '0.6.0'
    GUID              = '63e8bf79-62d3-4249-8fe6-9a766fbe8481'
    Author            = 'DSC Community'
    CompanyName       = 'DSC Community'
    Copyright         = 'Copyright the DSC Community contributors. All rights reserved.'
    Description       = 'DSC composite resource for https://github.com/dsccommunity/DscWorkshop'
    PowerShellVersion = '5.1'
    FunctionsToExport = '*'
    CmdletsToExport   = '*'
    VariablesToExport = '*'
    AliasesToExport   = '*'

    PrivateData       = @{

        PSData = @{
            Prerelease   = 'fix0001'
            Tags         = @('DesiredStateConfiguration', 'DSC', 'DSCResource')
            LicenseUri   = 'https://github.com/dsccommunity/CommonTasks/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/dsccommunity/CommonTasks'
            IconUri      = 'https://dsccommunity.org/images/DSC_Logo_300p.png'
            ReleaseNotes = ''
        }
    }
}
