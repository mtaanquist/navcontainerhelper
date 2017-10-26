#
# Module manifest for module 'PSGet_NavContainerHelper'
#
# Generated by: Freddy Kristiansen
#
# Generated on: 21-10-2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'NavContainerHelper.psm1'

# Version number of this module.
ModuleVersion = '0.1.1.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'ae60837a-fa30-4e28-a5ef-b8cd4cf6640a'

# Author of this module
Author = 'Freddy Kristiansen'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2017 Freddy Kristiansen. All rights reserved.'

# Description of the functionality provided by this module
Description = 'PowerShell module'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-NavContainerAppInfo', 'UnInstall-NavContainerApp', 
               'Get-NavContainerCountry', 'Get-NavContainerNavVersion', 
               'Open-NavContainer', 'Export-NavContainerObjects', 
               'Sync-NavContainerApp', 'UnPublish-NavContainerApp', 
               'Get-NavContainerId', 'Wait-NavContainerReady', 
               'Create-MyDeltaFolder', 'Import-ObjectsToNavContainer', 
               'Recreate-NavServerContainer', 'Get-NavContainerIpAddress', 
               'Install-NavContainerApp', 'Remove-NavContainer', 
               'Get-NavContainerLegal', 'Get-NavContainerSession', 
               'Get-NavContainerGenericTag', 'Convert-Txt2Al', 
               'Get-NavContainerName', 'Publish-NavContainerApp', 
               'Create-MyOriginalFolder', 'New-CSideDevContainer', 
               'New-NavContainer', 
               'Get-NavContainerImageName', 'Get-NavContainerPath', 
               'Remove-NavContainerSession', 'Get-NavContainerOsVersion', 
               'New-DesktopShortcut', 
               'Install-NAVSipCryptoProviderFromNavContainer', 
               'Enter-NavContainer', 'Remove-DesktopShortcut', 
               'Get-NavContainerSharedFolders', 'Test-NavContainer', 
               'Replace-NavServerContainer', 'Convert-ModifiedObjectsToAl', 
               'Compile-ObjectsInNavContainer', 'Write-NavContainerHelperWelcomeText',
               'Download-File', 'Get-LocaleFromCountry',
               'Copy-FileFromNavContainer', 'Copy-FileToNavContainer'


# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/Microsoft/navcontainerhelper/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://www.github.com/microsoft/navcontainerhelper'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

