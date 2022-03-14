﻿#
# Module manifest for module 'PowerShellDSC'
#
# Copyright="Â© Microsoft Corporation. All rights reserved."
#

@{

    ModuleVersion        = '1.2'

    GUID                 = '94b905ff-74b5-437e-89ed-7df44386533c'

    Author               = 'Microsoft Corporation'

    CompanyName          = 'Microsoft Corporation'

    Copyright            = 'Â© Microsoft Corporation. All rights reserved.'

    RequiredAssemblies   = @('Microsoft.Management.Infrastructure',
        'Microsoft.Windows.DSC.CoreConfProviders')

    NestedModules        = @('PSDesiredStateConfiguration.psm1',
        'Get-DSCConfiguration.cdxml',
        'Get-DSCLocalConfigurationManager.cdxml',
        'Restore-DSCConfiguration.cdxml',
        'Microsoft.Windows.DSC.CoreConfProviders.dll',
        'Get-DscConfigurationStatus.cdxml',
        'Stop-DscConfiguration.cdxml',
        'Remove-DscConfigurationDocument.cdxml',
        'Disable-DscDebug.cdxml',
        'Enable-DscDebug.cdxml',
        'DSCClassResources\WindowsPackageCab\WindowsPackageCab.psd1')

    TypesToProcess       = @('PSDesiredStateConfiguration.types.ps1xml')

    FormatsToProcess     = @('PSDesiredStateConfiguration.format.ps1xml')

    DscResourcesToExport = @('WindowsPackageCab')

    FunctionsToExport    = @('Configuration',
        'Get-DscConfiguration',
        'Get-DscLocalConfigurationManager',
        'Restore-DscConfiguration',
        'Update-DscConfiguration',
        'New-DscChecksum',
        'Get-DscResource',
        'Get-DscConfigurationStatus',
        'Stop-DscConfiguration',
        'Remove-DscConfigurationDocument',
        'Enable-DscDebug',
        'Disable-DscDebug')

    CmdletsToExport      = @('Set-DscLocalConfigurationManager',
        'Start-DscConfiguration',
        'Test-DscConfiguration',
        'Publish-DscConfiguration',
        'Update-DscConfiguration' ,
        'Invoke-DscResource')

    VariablesToExport    = '*'

    AliasesToExport      = @('sacfg',
        'tcfg',
        'gcfg',
        'rtcfg',
        'upcfg',
        'glcm',
        'slcm',
        'pbcfg',
        'cmpcfg',
        'gcfgs')

    HelpInfoURI          = 'https://go.microsoft.com/fwlink/?linkid=390814'

}
