# Data Lake items
$fileNameToUpload = "Invoice-1215752192.csv"
$dataLakePath = "/Spark-Data/" + $fileNameToUpload
$fileToUpload="C:\Users\guest\Desktop\Invoice\" + $fileNameToUpload
$destinationDataLakeAccount = "sampledatalakestore"

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
 
# Upload to Data Lake
$write =  "BEGIN Upload: " + $fileToUpload
Write-Output $write
Import-AzureRmDataLakeStoreItem -AccountName $destinationDataLakeAccount -Path $fileToUpload -Destination $dataLakePath -Force
$write =  "END   Upload: " + $fileToUpload
Write-Output $write

