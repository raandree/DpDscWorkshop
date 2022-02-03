@{
    PSDependOptions              = @{
        AddToPath  = $true
        Target     = 'output\RequiredModules'
        Parameters = @{
            Repository      = 'PSGallery'
            AllowPreRelease = $true
        }
    }

    'powershell-yaml'            = 'latest'
    InvokeBuild                  = 'latest'
    PSScriptAnalyzer             = 'latest'
    Pester                       = 'latest'
    Plaster                      = 'latest'
    ModuleBuilder                = 'latest'
    ChangelogManagement          = 'latest'
    Sampler                      = 'latest'
    'Sampler.GitHubTasks'        = 'latest'
    PowerShellForGitHub          = 'latest'
    'Sampler.DscPipeline'        = '0.2.0-preview0001'
    MarkdownLinkCheck            = 'latest'
    'DscResource.AnalyzerRules'  = 'latest'
    DscBuildHelpers              = 'latest'
    #Datum                        = '0.39.0'
    ProtectedData                = 'latest'
    'Datum.ProtectedData'        = 'latest'
    #'Datum.InvokeCommand'        = 'latest'
    ReverseDSC                   = 'latest'
    Configuration                = 'latest'
    Metadata                     = 'latest'
    xDscResourceDesigner         = 'latest'
    'DscResource.Test'           = 'latest'

    # Composites
    CommonTasks                  = '0.6.1-preview0001'

    # DSC Resources
    xPSDesiredStateConfiguration = '9.1.0'
    ComputerManagementDsc        = '8.5.0'
    NetworkingDsc                = '8.2.0'
    JeaDsc                       = '0.7.2'
    XmlContentDsc                = '0.0.1'
    xWebAdministration           = '3.2.0'
    SecurityPolicyDsc            = '2.10.0.0'
    StorageDsc                   = '5.0.1'
    Chocolatey                   = '0.0.79'
    ActiveDirectoryDsc           = '6.0.1'
    DfsDsc                       = '4.4.0.0'
    WdsDsc                       = '0.11.0'
    xDhcpServer                  = '3.0.0'
    xDscDiagnostics              = '2.8.0'
    DnsServerDsc                 = '3.0.0'
    xFailoverCluster             = '1.16.0'
    GPRegistryPolicyDsc          = '1.2.0'
    AuditPolicyDsc               = '1.4.0.0'
    SharePointDSC                = '4.8.0'
    xExchange                    = '1.33.0'
    SqlServerDsc                 = '15.2.0'
    UpdateServicesDsc            = '1.2.1'
    xWindowsEventForwarding      = '1.0.0.0'
    OfficeOnlineServerDsc        = '1.5.0'
    xBitlocker                   = '1.4.0.0'
    ActiveDirectoryCSDsc         = '5.0.0'
    'xHyper-V'                   = '3.17.0.0'
    DSCR_PowerPlan               = '1.3.0'
    FileSystemDsc                = '1.1.1'
    PackageManagement            = '1.4.7'
    PowerShellGet                = '2.2.5'
    ConfigMgrCBDsc               = '2.1.0-preview0006' # Gallery version has extremely old SQL dependencies
}
