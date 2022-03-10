# SharePointDSC minimum version 5.0.0
configuration SharePointDiagnosticLoggingSettings
{
    param (
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $SetupAccount,

        [Parameter(Mandatory = $true)]
        [System.String]
        $LogPath,

        [Parameter(Mandatory = $true)]
        [System.UInt32]
        $LogSpaceInGB,

        [Parameter()]
        [System.Boolean]
        $AppAnalyticsAutomaticUploadEnabled,

        [Parameter()]
        [System.Boolean]
        $CustomerExperienceImprovementProgramEnabled,

        [Parameter()]
        [System.UInt32]
        $DaysToKeepLogs,

        [Parameter()]
        [System.Boolean]
        $DownloadErrorReportingUpdatesEnabled,

        [Parameter()]
        [System.Boolean]
        $ErrorReportingAutomaticUploadEnabled,

        [Parameter()]
        [System.Boolean]
        $ErrorReportingEnabled,

        [Parameter()]
        [System.Boolean]
        $EventLogFloodProtectionEnabled,

        [Parameter()]
        [System.UInt32]
        $EventLogFloodProtectionNotifyInterval,

        [Parameter()]
        [System.UInt32]
        $EventLogFloodProtectionQuietPeriod,

        [Parameter()]
        [System.UInt32]
        $EventLogFloodProtectionThreshold,

        [Parameter()]
        [System.UInt32]
        $EventLogFloodProtectionTriggerPeriod,

        [Parameter()]
        [System.UInt32]
        $LogCutInterval,

        [Parameter()]
        [System.Boolean]
        $LogMaxDiskSpaceUsageEnabled,

        [Parameter()]
        [System.UInt32]
        $ScriptErrorReportingDelay,

        [Parameter()]
        [System.Boolean]
        $ScriptErrorReportingEnabled,

        [Parameter()]
        [System.Boolean]
        $ScriptErrorReportingRequireAuth,

        [Parameter()]
        [ValidateSet("Present",
            "Absent")]
        [System.String]
        $Ensure
    )

    Import-DscResource -ModuleName SharePointDSC

    $PSBoundParameters.Add('IsSingleInstance', 'Yes')
    $PSBoundParameters.Add('PsDscRunAsCredential', $SetupAccount)
    $PSBoundParameters.Remove('InstanceName')
    $PSBoundParameters.Remove('SetupAccount')
    $PSBoundParameters.Remove('DependsOn')

    (Get-DscSplattedResource -ResourceName SPDiagnosticLoggingSettings -ExecutionName 'ApplyDiagnosticLogSettings' -Properties $PSBoundParameters -NoInvoke).Invoke($PSBoundParameters)
}
