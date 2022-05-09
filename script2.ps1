Function ShowStorageContainer
{
    Write-Host -ForegroundColor Green "Retreiving container list..."
    $containers = Get-AzStorageContainer -Context $Context
    # Iterate containers, display properties
    Foreach ($container in $containers) 
    {
    $containerProperties = $container.BlobContainerClient.GetProperties()
        Write-Host -ForegroundColor Yellow $container.Name
    }

}

ShowStorageContainer