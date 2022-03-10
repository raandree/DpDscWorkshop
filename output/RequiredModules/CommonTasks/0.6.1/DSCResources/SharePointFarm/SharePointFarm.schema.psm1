 # SharePointDSC minimum version 5.0.0
configuration SharePointFarm
{
    param
    (
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $SetupAccount,

        [Parameter(Mandatory = $true)]
        [System.String]
        $FarmConfigDatabaseName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DatabaseServer,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $FarmAccount,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Passphrase,

        [Parameter(Mandatory = $true)]
        [System.String]
        $AdminContentDatabaseName,

        [Parameter(Mandatory = $true)]
        [System.Boolean]
        $RunCentralAdmin,

        [Parameter()]
        [System.String]
        $CentralAdministrationUrl,

        [Parameter()]
        [ValidateRange(1, 65535)]
        [System.UInt32]
        $CentralAdministrationPort,

        [Parameter()]
        [System.String]
        [ValidateSet("NTLM", "Kerberos")]
        $CentralAdministrationAuth,

        [Parameter()]
        [System.String]
        [ValidateSet("Application",
            "ApplicationWithSearch",
            "Custom",
            "DistributedCache",
            "Search",
            "SingleServerFarm",
            "WebFrontEnd",
            "WebFrontEndWithDistributedCache")]
        $ServerRole,

        [Parameter()]
        [ValidateSet("Off", "On", "OnDemand")]
        [System.String]
        $DeveloperDashboard,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationCredentialKey,

        [Parameter()]
        [System.Boolean]
        $SkipRegisterAsDistributedCacheHost,

        [Parameter()]
        [System.Boolean]
        $useSQLAuthentication,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $DatabaseCredentials
    )

    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName SharePointDSC

    $PSBoundParameters.Remove('InstanceName')

    # Make the Setup Account a local Administrator
    xGroup 'LocalAdministrators' {
        Ensure           = 'Present'
        GroupName        = 'Administrators'
        MembersToInclude =  $SetupAccount.UserName
    }


    $ExecutionProperties = $PSBoundParameters
    $ExecutionProperties.Add('Ensure', 'Present')
    $ExecutionProperties.Add('IsSingleInstance', 'Yes')
    $ExecutionProperties.Add('PsDscRunAsCredential', $SetupAccount)
    $ExecutionProperties.Add('DependsOn', '[xGroup]LocalAdministrators')
    $ExecutionProperties.Remove('InstanceName')
    $ExecutionProperties.Remove('SetupAccount')

    #(Get-DscSplattedResource -ResourceName SPFarm -ExecutionName 'SharePointFarm' -Properties $ExecutionProperties -NoInvoke).Invoke($ExecutionProperties)

    # Setup Wizzard
    SPConfigWizard RunConfigWizard
    {
        IsSingleInstance     = "Yes"
        PsDscRunAsCredential = $SetupAccount
        DependsOn = '[xGroup]LocalAdministrators'
    }
}
