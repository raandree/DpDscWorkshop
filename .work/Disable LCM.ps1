[DSCLocalConfigurationManager()]
Configuration LCM
{
    Settings
    {
        ConfigurationMode = 'MonitorOnly'
        RefreshFrequencyMins = 30
        ConfigurationModeFrequencyMins = 60
        RefreshMode = 'Disabled'
        RebootNodeIfNeeded = $true
    }
}

LCM -OutputPath c:\dsc
Set-DscLocalConfigurationManager -Path C:\dsc -Verbose
