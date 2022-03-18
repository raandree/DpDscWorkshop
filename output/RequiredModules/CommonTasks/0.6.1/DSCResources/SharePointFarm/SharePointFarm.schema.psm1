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

    Import-DscResource -ModuleName SharePointDSC
    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    # Make the Setup Account a local Administrator
    xGroup 'LocalAdministrators' {
        Ensure           = 'Present'
        GroupName        = 'Administrators'
        MembersToInclude =  $SetupAccount.UserName
    }

    # Create or Join Farm with SPFarm
    $spFarmValidParameters = @('AdminContentDatabaseName', 'ApplicationCredentialKey', 'CentralAdministrationAuth', 'CentralAdministrationPort', 'CentralAdministrationUrl', 'DatabaseCredentials', 'DatabaseServer', 'DeveloperDashboard', 'Ensure', 'FarmAccount', 'FarmConfigDatabaseName', 'Passphrase', 'RunCentralAdmin', 'ServerRole', 'SkipRegisterAsDistributedCacheHost',
        'UseSQLAuthentication')

    $spFarm = @{
        IsSingleInstance     = 'Yes'
        PsDscRunAsCredential = $SetupAccount
        DependsOn            = '[xGroup]LocalAdministrators'
    }
    foreach ($parameter in $spFarmValidParameters)
    {
        if ($PSBoundParameters.ContainsKey($parameter))
        {
            $spFarm.Add($parameter, $PSBoundParameters.Item($parameter))
        }
    }
    (Get-DscSplattedResource -ResourceName SPFarm -ExecutionName 'SPFarm' -Properties $spFarm -NoInvoke).Invoke($spFarm)


    # Setup Wizzard
    SPConfigWizard RunConfigWizard
    {
        IsSingleInstance     = "Yes"
        PsDscRunAsCredential = $SetupAccount
        DependsOn            = '[SPFarm]SPFarm'
    }
}
