#ps script to install ZVM

param(
	[Parameter(Mandatory = $true, HelpMessage = "Path to the ZVM installer")]$ZvmInstallationPath, 
	[Parameter(Mandatory = $true, HelpMessage = "VC IP")]$VcHostName, 
	[Parameter(Mandatory = $true, HelpMessage = "Globally unique identifier")]$AvsTenantId, 
	[Parameter(Mandatory = $true, HelpMessage = "Application ID")]$AvsClientId, 
	[Parameter(Mandatory = $true, HelpMessage = "The ID of the target subscription")]$AvsSubscriptionId, 
	[Parameter(Mandatory = $true, HelpMessage = "AWS resources that are all in the same AWS Region")]$AvsResourceGroup, 
	[Parameter(Mandatory = $true, HelpMessage = "Private cloud name")]$AvsCloudName, 
	[Parameter(Mandatory = $true, HelpMessage = "URL (Verify that the certificate is valid).")]$AvsTokenUrl
	)

$VcUserName = Read-Host -Prompt "Enter VC user name (right click on mouse to paste)" -AsSecureString
$VcUserName = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($VcUserName))

$VcPassword = Read-Host -Prompt "Enter VC password (right click on mouse to paste)" -AsSecureString
$VcPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($VcPassword))

$AvsClientSecret = Read-Host -Prompt "Enter AVS client secret (right click on mouse to paste)" -AsSecureString
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
