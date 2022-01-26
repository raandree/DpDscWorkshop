$mof = Get-Content .\output\MOF\OSS002.mof -Raw
$pattern = '(instance of DSC_xRegistryResource)[\s\S]+(ResourceID = "\[xRegistry\]DscModules::\[DscTagging\]DscTagging")[\s\S]+ValueName = "Layers"[\s\S]+(ValueData = {)(?<Layers>[\w\s"\\,]+)(};)'


if ($mof -match $pattern)
{
    $layers = $Matches.Layers -split "\n"
    $role = ($layers -replace '"|,', '') -replace '\\\\', '\' |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -like 'Baseline*' }
    ($role -split '\\')[1]
}
