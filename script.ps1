################# Azure Blob Storage - PowerShell ####################  

## Showing list of containers
Function ShowStorageContainer
{
    Write-Host -ForegroundColor Green "Retreiving container list..."  
    $containers = Get-AzStorageContainer -Context $Context
    # Iterate containers, display properties
    Foreach ($container in $containers) 
    {
    $containerProperties = $container.BlobContainerClient.GetProperties()
        Write-Host $container.Name "Properties:"
        $containerProperties.Value
    }

}

ShowStorageContainer

## Input Parameters
$name=read-host "Enter container to delete..." 
$containerName=($name)

## Function to delete a container  
Function DeleteStorageContainer  
{  
    Write-Host -ForegroundColor Green "Deleting the storage container $containerName"       
    ## Delete a container  
    Remove-AzStorageContainer -Container $containerName -Context $Context -Confirm
}
  
DeleteStorageContainer

ShowStorageContainer