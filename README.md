# Deployment of RHEL 7.2 with full disk encryption

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjkritzen%2Fazr-rh%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


This template creates a fully-encrypted RHEL 7.2 VM in Azure. The VM consists of:

- 30 GB encrypted OS drive.
- A 1TB RAID-0 array

## Prerequisites:

Azure Disk Encryption securely stores the encryption secrets in a specified Azure Key Vault. You will need client ID and client secret of an AAD application to enable key vault authentication.

The [AzureDiskEncryptionPreRequisiteSetup.ps1](https://github.com/Azure/azure-powershell/blob/dev/src/ResourceManager/Compute/Commands.Compute/Extension/AzureDiskEncryption/Scripts/AzureDiskEncryptionPreRequisiteSetup.ps1) script can be used to create the Key Vault and assign appropriate access policies.

## Monitoring progress

It will take roughly one hour to encrypt the OS drive. You can monitor the encryption progress by calling `Get-AzureRmVmDiskEncryptionStatus` PowerShell cmdlet as shown below.

    C:\> Get-AzureRmVmDiskEncryptionStatus -ResourceGroupName $ResourceGroupName -VMName $VMName
    -ExtensionName $ExtensionName

    OsVolumeEncrypted          : EncryptionInProgress
    DataVolumesEncrypted       : EncryptionInProgress
    OsVolumeEncryptionSettings : Microsoft.Azure.Management.Compute.Models.DiskEncryptionSettings
    ProgressMessage            : OS disk encryption started

Once the cmdlet shows the message `VMRestartPending`, like the one show below, reboot the VM.

    C:\> Get-AzureRmVmDiskEncryptionStatus -ResourceGroupName $ResourceGroupName -VMName $VMName
    -ExtensionName $ExtensionName
    
    OsVolumeEncrypted          : VMRestartPending
    DataVolumesEncrypted       : Encrypted
    OsVolumeEncryptionSettings : Microsoft.Azure.Management.Compute.Models.DiskEncryptionSettings
    ProgressMessage            : OS disk successfully encrypted, please reboot the VM


`/` will be mounted mounted from a AES-256 bit encrypted drive:

    # cryptsetup status osencrypt
    /dev/mapper/osencrypt is active and is in use.
      type:    n/a
      cipher:  aes-xts-plain64
      keysize: 256 bits
      device:  /dev/sda2
      offset:  0 sectors
      size:    61888512 sectors
      mode:    read/write

If you run the `Get-AzureRmVmDiskEncryptionStatus` cmdlet again, you will see updated encryption status:

    C:\> Get-AzureRmVmDiskEncryptionStatus -ResourceGroupName $ResourceGroupName -VMName $VMName
    -ExtensionName $ExtensionName

    OsVolumeEncrypted          : Encrypted
    DataVolumesEncrypted       : Encrypted
    OsVolumeEncryptionSettings : Microsoft.Azure.Management.Compute.Models.DiskEncryptionSettings
    ProgressMessage            : [KeyVault URL of LUKS passphrase secret]

## References:

- [White paper](https://azure.microsoft.com/en-us/documentation/articles/azure-security-disk-encryption/)
- [Explore Azure Disk Encryption with Azure Powershell](https://blogs.msdn.microsoft.com/azuresecurity/2015/11/16/explore-azure-disk-encryption-with-azure-powershell/)
- [Explore Azure Disk Encryption with Azure PowerShell – Part 2](http://blogs.msdn.com/b/azuresecurity/archive/2015/11/21/explore-azure-disk-encryption-with-azure-powershell-part-2.aspx)
