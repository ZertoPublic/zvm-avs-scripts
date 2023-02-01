#ps script to install ZVM

param(
	[Parameter(Mandatory = $true, HelpMessage = "Path to the ZVM installer")]$ZvmInstallationPath, 
	[Parameter(Mandatory = $true, HelpMessage = "vCenter Server IP address")]$VcHostName, 
	[Parameter(Mandatory = $true, HelpMessage = "Azure Active Directory Tenant ID")]$AvsTenantId, 
	[Parameter(Mandatory = $true, HelpMessage = "Application ID")]$AvsClientId, 
	[Parameter(Mandatory = $true, HelpMessage = "Azure Subscription ID")]$AvsSubscriptionId, 
	[Parameter(Mandatory = $true, HelpMessage = "Azure Resource Group name")]$AvsResourceGroup, 
	[Parameter(Mandatory = $true, HelpMessage = "Azure VMware Solution private cloud name")]$AvsCloudName, 
	[Parameter(Mandatory = $true, HelpMessage = "Application ID URI (Verify that the certificate is valid).")]$AvsTokenUrl
	)

$VcUserName = Read-Host -Prompt "Enter vCenter Server user name (right click on mouse to paste)" -AsSecureString
$VcUserName = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($VcUserName))

$VcPassword = Read-Host -Prompt "Enter vCenter Server password (right click on mouse to paste)" -AsSecureString
$VcPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($VcPassword))

$AvsClientSecret = Read-Host -Prompt "Enter App Registration client secret (right click on mouse to paste)" -AsSecureString
$AvsClientSecret = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($AvsClientSecret))

Write-Host "The ZVM installation process started. Wait for the process to finish."

Start-Process -FilePath "$ZvmInstallationPath" -ArgumentList "-s VCenterHostName=$VcHostName VCenterUserName=$VcCredential.Username VCenterPassword=$VcCredential.Password AvsTenantId=$AvsTenantId AvsClientId=$AvsClientId AvsClientSecret=$AvsClientSecret AvsSubscriptionId=$AvsSubscriptionId AvsResourceGroup=$AvsResourceGroup AvsCloudName=$AvsCloudName AvsTokenUrl=$AvsTokenUrl ShouldUpgradeVra=False" -wait

Write-Host "The installer process finished. Use the ZVM to check if the process finished successfully."
Write-Host "If the ZVM User Interface does not load, reinstall the ZVM or contact Zerto Support."


<#
Path to ZVM installation logs:
a. C:\Users\Administrator\AppData\Local\Temp\Zerto_Virtual_Replication_<number>.log
b. C:\ProgramData\Zerto\InstallLog\Zerto_Virtual_Replication_<number>.log
#>
