# Get-Mailbox -Resultsize Unlimited | Get-ADPermission | Where {($_.ExtendedRights -like "*Send-As*") -and ($_.User -ne "*NT-AUTORITÄT\SELBST*") -and ($_.User -ne "*BOSKAMP\Domänen-Admins*") -and ($_.User -ne "*BOSKAMP\APP-Exchange-SendenAls-Berechtigung*")} | select Identity,User | export-csv C:\_Skripting-Ausgabe\Exchange_SendAs_ShowDisabledUser.csv -Delimiter ";" -encoding unicode
Get-Mailbox -Resultsize Unlimited | Get-ADPermission | Where {($_.ExtendedRights -like "*Send-As*")} | select Identity,User



#export-csv C:\_Skripting-Ausgabe\Exchange_SendAs_ShowDisabledUser.csv -Delimiter ";" -encoding unicode