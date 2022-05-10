## Funtion for removing containers, needs to be put ahead of the other
Function DeleteStorageContainer  
{  
    Write-Host -ForegroundColor Red "Deleting empty container " $container.Name       
    ## Delete a container  
    Remove-AzStorageContainer -Container $container.Name -Context $Context
}
## Showing list of containers, then for each container run blob argument against it and remove if greater than or equal 1
Function StorageContainer
{
    Write-Host -ForegroundColor Blue "Retreiving container list..."
    Get-AzStorageContainer -Context $Context  
    $containers = Get-AzStorageContainer -Context $Context
    # Iterate containers, display properties
    Foreach ($container in $containers) 
    {
        $blobs = Get-AzStorageBlob -Context $Context -Container $container.Name
        if ($blobs.count -ge 1) {
            Write-Host -ForegroundColor Green $container.Name "is not empty, it contains" $blobs.Name.count "files!" 
            Write-Host "Skipping..."
        } else {
            Write-Host -ForegroundColor Yellow $container.Name "has no files, deleting..."
            DeleteStorageContainer
        }
    }

}

StorageContainer

Write-Host -ForegroundColor Green "Containers remaining after cleanup:"
Get-AzStorageContainer -Context $Context
