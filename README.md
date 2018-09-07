# Deployment of RHEL 7.2 with full disk encryption

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjkritzen%2Fazr-rh%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


This nested template creates a fully-encrypted RHEL 7.2 VM in Azure. The VM consists of:

- 30 GB encrypted OS drive.
- A 1TB RAID-0 array with 10x 100GB Disks including LVM Layout

## Prerequisites:

Azure Disk Encryption securely stores the encryption secrets in a specified Azure Key Vault. You will need client ID and client secret of an AAD application to enable key vault authentication.

The [AzureDiskEncryptionPreRequisiteSetup.ps1](https://github.com/Azure/azure-powershell/blob/dev/src/ResourceManager/Compute/Commands.Compute/Extension/AzureDiskEncryption/Scripts/AzureDiskEncryptionPreRequisiteSetup.ps1) script can be used to create the Key Vault and assign appropriate access policies.


NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
fd0                    2:0    1    4K  0 disk  
sda                    8:0    0   32G  0 disk  
├─sda1                 8:1    0  500M  0 part  /boot
└─sda2                 8:2    0 31,5G  0 part  /
sdb                    8:16   0  200G  0 disk  
└─sdb1                 8:17   0  200G  0 part  /mnt/resource
sdc                    8:32   0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdd                    8:48   0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sde                    8:64   0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdf                    8:80   0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdg                    8:96   0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdh                    8:112  0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdi                    8:128  0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdj                    8:144  0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdk                    8:160  0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sdl                    8:176  0  128G  0 disk  
└─md0                  9:0    0  1,3T  0 raid0 
  ├─sapvg-sapmnt     253:0    0   15G  0 lvm   /sapmnt
  ├─sapvg-usrsap     253:1    0   42G  0 lvm   /usr/sap
  ├─sapvg-sirax      253:2    0  100G  0 lvm   /SIRAX
  ├─sapvg-hanalog    253:3    0  105G  0 lvm   /hana/log
  ├─sapvg-hanashared 253:4    0  311G  0 lvm   /hana/shared
  ├─sapvg-hanadata   253:5    0  481G  0 lvm   /hana/data
  └─sapvg-sapinst    253:6    0  164G  0 lvm   /mnt/sapinst
sr0                   11:0    1  628K  0 rom  
## Monitoring progress

It will take roughly one hour to encrypt the OS drive. You can monitor the encryption progress by calling Azure CLI cmdlet as shown below:

    az vm encryption show --name $VMName --resource-group $ResourceGroup -o table

    DataDisk              OsDisk                OsType    ProgressMessage
    --------------------  --------------------  --------  -------------------------------
    EncryptionInProgress  EncryptionInProgress  Linux     Encrypting data volume 3/7: 10%


Once the cmdlet shows the message `VMRestartPending`reboot the VM.

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
