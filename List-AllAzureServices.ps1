$subscriptionsList = Get-AzSubscription

$azureResourceTypes = @{}

foreach ($subscription in $subscriptionsList) {

    Write-Host "Getting Azure resource groups and subscriptions state across subscription $($subscription.Id) - ($($subscription.Name))"

    $subscription | Set-AzContext -Scope CurrentUser | Out-Null

    $resourcesList = Get-AzResource

    foreach ($resource in $resourcesList) {
        if ($null -eq $azureResourceTypes[$resource.ResourceType]) {
            $azureResourceTypes[$resource.ResourceType] = 0;
        }

        $azureResourceTypes[$resource.ResourceType]++
    }

}

$azureResourceTypesList = @()

foreach ($type in $azureResourceTypes.Keys) {
    $azureResourceTypesList += @{
        "type"              = $type
        "resources_count"   = $azureResourceTypes[$type]
    }
}

$azureResourceTypesList