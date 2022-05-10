################# Azure Blob Storage - PowerShell ####################  
Function DeleteStorageContainer  
{  
    Write-Host -ForegroundColor Green "Deleting empty container " $container.Name       
    ## Delete a container  
    Remove-AzStorageContainer -Container $container.Name -Context $Context
}
## Showing list of containers
Function StorageContainer
{
    Write-Host -ForegroundColor Green "Retreiving container list..."  
    $containers = Get-AzStorageContainer -Context $Context
    # Iterate containers, display properties
    Foreach ($container in $containers) 
    {
        $blobs = Get-AzStorageBlob -Context $Context -Container $container.Name
        if ($blobs.count -ge 1) {
            Write-Host $container.Name "is not empty, it contains" $blobs.Name.count "files!" 
            Write-Host "Skipping..."
        } else {
            Write-Host $container.Name "has no files, deleting..."
            DeleteStorageContainer
        }
    }

}

StorageContainer
Write-Host "Containers remaining after cleanup:"
Get-AzStorageContainer -Context $Context
