try
{
$passwordPlain = "Ravi@Sara13&9"

# Convert plain text password to SecureString
$password = ConvertTo-SecureString $passwordPlain -AsPlainText -Force

New-AzVM -ResourceGroupName MyResourceGroup -Name VMWin -Location canadacentral -VirtualNetworkName "VMWin-VNet" -SubnetName "VMWin-Subnet" -SecurityGroupName "VMWin-NSG" -PublicIpAddressName "VMWin-PIP" -Credential (New-Object PSCredential(“azureuser”, $password)) -ImageName "Win2019Datacenter" -Size "Standard_DS1_v2"
}
catch
{
Write-Host "Error: $($_.Exception.Message)"
}
