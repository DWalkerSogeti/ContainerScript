################# Azure Blob Storage - PowerShell ####################  

## Showing list of containers
Function ShowStorageContainer
{
    Write-Host -ForegroundColor Green "Retreiving container list..."  
    $containers = Get-AzStorageContainer -Context $Context
    # Iterate containers, display properties
    Foreach ($container in $containers) 
    {
        $blobs = Get-AzStorageBlob -Context $Context -Container $container.Name
        Write-Host $container.Name "found..."
    }

}

ShowStorageContainer

## Input Parameters 


## Function to delete a container  
Function DeleteStorageContainer  
{  
    Write-Host -ForegroundColor Green "Deleting the storage container $container.Name"       
    ## Delete a container  
    Remove-AzStorageContainer -Container $container.Name -Context $Context
}

if ($blobs.count -ge 1) {
    $true
} else {
    $false
    DeleteStorageContainer
}


ShowStorageContainer