# Data Lake items
$fileNameToUpload = "Invoice-1215752192.csv"
$dataLakePath = "/Spark-Data/" + $fileNameToUpload
$fileToDownload="C:\Users\guest\Desktop\Invoice1\" + $fileNameToUpload
$sourceDataLakeAccount = "sampledatalakestore"

# Login Items
$tenant = "<<REMOVED>>"
$clientKey = "<<REMOVED>>"
$clientId = "<<REMOVED>>"
$subscriptionId = "<<REMOVED>>"

# Login an select subscription
$secpasswd = ConvertTo-SecureString $clientKey -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($clientId, $secpasswd)
Login-AzureRmAccount -ServicePrincipal -Tenant $tenant  -Credential $mycreds
Select-AzureRmSubscription -SubscriptionId $subscriptionId
 
# Download from Data Lake
$write =  "BEGIN Download: " + $fileToDownload
Write-Output $write
Export-AzureRmDataLakeStoreItem -AccountName $destinationDataLakeAccount -Path $dataLakePath -Destination $fileToDownload -Force
$write =  "END   Download: " + $fileToDownload
Write-Output $write

