################# Azure Blob Storage - PowerShell ####################  
  
## Input Parameters  
$resourceGroupName="azpractice"  
$storageAccName="azstorageacc1122020"  
$containerName="container003"  
  
## Connect to Azure Account  
Connect-AzAccount   
  
## Function to delete a container  
Function DeleteStorageContainer  
{  
    Write-Host -ForegroundColor Green "Deleting the storage container.."      
    ## Get the storage account in which container has to be created  
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName      
    ## Get the storage account context  
    $ctx=$storageAcc.Context  
    ## Delete a container  
    Remove-AzStorageContainer -Container $containerName -Context $ctx -Force   
}  
  
DeleteStorageContainer   
  
## Disconnect from Azure Account  
Disconnect-AzAccount  