﻿<# 
 .Synopsis
  Download App from NAV/BC Container
 .Description
 .Parameter containerName
  Name of the container which you want to use to compile the app
 .Parameter publisher
  Publisher of the app you want to download
 .Parameter appName
  Name of the app you want to download
 .Parameter appVersion
  Version of the app you want to download
 .Parameter tenant
  Tenant from which you want to download an app
 .Parameter appFile
  Path to the location where you want the app to be copied
 .Parameter credential
  Credentials of the SUPER user if using NavUserPassword authentication
 .Example
  $appFile = Get-BcContainerApp -containerName test -publisher "Microsoft" -appName "Base Application" -appVersion "15.0.35528.0"
#>
function Get-BcContainerApp {
    Param (
        [string] $containerName = $bcContainerHelperConfig.defaultContainerName,
        [string] $publisher,
        [string] $appName,
        [string] $appVersion,
        [Parameter(Mandatory=$false)]
        [string] $Tenant = "default",
        [Parameter(Mandatory=$false)]
        [string] $appFile = (Join-Path $extensionsFolder "$containerName\$appName.app"),
        [Parameter(Mandatory=$false)]
        [PSCredential] $credential = $null
    )

$telemetryScope = InitTelemetryScope -name $MyInvocation.InvocationName -parameterValues $PSBoundParameters -includeParameters @()
try {

    $startTime = [DateTime]::Now

    $platform = Get-BcContainerPlatformversion -containerOrImageName $containerName
    if ("$platform" -eq "") {
        $platform = (Get-BcContainerNavVersion -containerOrImageName $containerName).Split('-')[0]
    }
    [System.Version]$platformversion = $platform
    

    $customConfig = Get-BcContainerServerConfiguration -ContainerName $containerName

    $serverInstance = $customConfig.ServerInstance
    if ($customConfig.DeveloperServicesSSLEnabled -eq "true") {
        $protocol = "https://"
    }
    else {
        $protocol = "http://"
    }

    $ip = Get-BcContainerIpAddress -containerName $containerName
    if ($ip) {
        $devServerUrl = "$($protocol)$($ip):$($customConfig.DeveloperServicesPort)/$ServerInstance"
    }
    else {
        $devServerUrl = "$($protocol)$($containerName):$($customConfig.DeveloperServicesPort)/$ServerInstance"
    }

    $sslVerificationDisabled = ($protocol -eq "https://")
    if ($sslVerificationDisabled) {
        if (-not ([System.Management.Automation.PSTypeName]"SslVerification").Type)
        {
            Add-Type -TypeDefinition "
                using System.Net.Security;
                using System.Security.Cryptography.X509Certificates;
                public static class SslVerification
                {
                    private static bool ValidationCallback(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; }
                    public static void Disable() { System.Net.ServicePointManager.ServerCertificateValidationCallback = ValidationCallback; }
                    public static void Enable()  { System.Net.ServicePointManager.ServerCertificateValidationCallback = null; }
                }"
        }
        Write-Host "Disabling SSL Verification"
        [SslVerification]::Disable()
    }
    
    $webClient = [TimeoutWebClient]::new(300000)
    if ($customConfig.ClientServicesCredentialType -eq "Windows") {
        $webClient.UseDefaultCredentials = $true
    }
    else {
        if (!($credential)) {
            throw "You need to specify credentials when you are not using Windows Authentication"
        }
        
        $pair = ("$($Credential.UserName):"+[System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($credential.Password)))
        $bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
        $base64 = [System.Convert]::ToBase64String($bytes)
        $basicAuthValue = "Basic $base64"
        $webClient.Headers.Add("Authorization", $basicAuthValue)
    }

    Write-Host "Downloading app: $appName"
    $url = "$devServerUrl/dev/packages?publisher=$([uri]::EscapeDataString($publisher))&appName=$([uri]::EscapeDataString($appName))&versionText=$($appVersion)&tenant=$tenant"
    Write-Host "Url : $Url"
    try {
        $webClient.DownloadFile($url, $appFile)
    }
    catch [System.Net.WebException] {
        Write-Host "ERROR $($_.Exception.Message)"
        throw (GetExtendedErrorMessage $_)
    }

    if ($sslverificationdisabled) {
        Write-Host "Re-enabling SSL Verification"
        [SslVerification]::Enable()
    }

    $appFile
}
catch {
    TrackException -telemetryScope $telemetryScope -errorRecord $_
    throw
}
finally {
    TrackTrace -telemetryScope $telemetryScope
}
}
Set-Alias -Name Get-NavContainerApp -Value Get-BcContainerApp
Export-ModuleMember -Function Get-BcContainerApp -Alias Get-NavContainerApp
