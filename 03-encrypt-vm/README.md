# Enable encryption on a running Linux VM. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjkritzen%2Fazr-rh%2Fmaster%2F03-encrypt-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
https://raw.githubusercontent.com/jkritzen/azr-rh/master/03-encrypt-vm/azuredeploy.json

This template enables encryption on a running linux vm using AAD client secret. This template assumes that the VM is located in the same region as the resource group. If not, please edit the template to pass appropriate location for the VM sub-resources.

## Prerequisites:
Azure Disk Encryption securely stores the encryption secrets in a specified Azure Key Vault.

The [AzureDiskEncryptionPreRequisiteSetup.ps1](https://github.com/Azure/azure-powershell/blob/dev/src/ResourceManager/Compute/Commands.Compute/Extension/AzureDiskEncryption/Scripts/AzureDiskEncryptionPreRequisiteSetup.ps1) script can be used to create the Key Vault and assign appropriate access policies.

Use the below PS cmdlet for getting the "keyVaultSecretUrl" and "keyVaultResourceId"

    Get-AzureRmKeyVault -VaultName $KeyVaultName -ResourceGroupName $rgname

References:

- [White paper](https://azure.microsoft.com/en-us/documentation/articles/azure-security-disk-encryption/)
- [Explore Azure Disk Encryption with Azure Powershell](https://blogs.msdn.microsoft.com/azuresecurity/2015/11/16/explore-azure-disk-encryption-with-azure-powershell/)
- [Explore Azure Disk Encryption with Azure PowerShell – Part 2](http://blogs.msdn.com/b/azuresecurity/archive/2015/11/21/explore-azure-disk-encryption-with-azure-powershell-part-2.aspx)

