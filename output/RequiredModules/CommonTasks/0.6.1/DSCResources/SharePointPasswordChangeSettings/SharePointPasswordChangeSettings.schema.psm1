# SharePointDSC minimum version 5.0.0
configuration SharePointPasswordChangeSettings
{
    param (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MailAddress,

        [Parameter()]
        [System.UInt32]
        $DaysBeforeExpiry,

        [Parameter()]
        [System.UInt32]
        $PasswordChangeWaitTimeSeconds,

        [Parameter()]
        [System.UInt32]
        $NumberOfRetries
    )

    Import-DscResource -ModuleName SharePointDSC

    $PSBoundParameters.Add('IsSingleInstance', 'Yes')
    $PSBoundParameters.Remove('InstanceName')
    $PSBoundParameters.Remove('PsDscRunAsCredential')
    $PSBoundParameters.Remove('DependsOn')

    (Get-DscSplattedResource -ResourceName SPPasswordChangeSettings -ExecutionName 'ManagedAccountPasswordResetSettings' -Properties $PSBoundParameters -NoInvoke).Invoke($PSBoundParameters)
}
