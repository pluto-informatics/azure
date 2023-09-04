## Launch and export to CSV

List all resource types across all subscriptions under your tenant at control plane level and count them:

```
# Login first with Login-AzAccount to Azure with account which has at least Reader access to all resources

$resourceTypes = ./List-AllAzureServices.ps1
$resourceTypes | Export-Csv services.csv
```

### Analyze for monitoring prioritization and logs selection

Use this doc to find log categories to enable or disable in resource Diagnostic Settings: [Supported categories for Azure Monitor resource logs](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/logs-index)