$Postfach = Get-Mailbox 
$Postfach | % {
	$displayname = $_.displayname
	$now=Get-Date
	Get-MailboxAutoReplyConfiguration $_ | ? { ($_.AutoReplyState -ne "disabled") -and ($_.starttime -lt $now) -and ($_.endtime -gt $now) } | 
	% {
		$OOFText=$_.internalmessage
			
		if ($_.AutoReplyState -eq "enabled")
		{ 
			Write-Host $displayname " ===> aktuell abwesend"
			#$OOFText | Out-File -FilePath "C:\temp\$displayname.txt" -encoding "default"
		}
		else
		{		
			Write-Host $displayname "geplant von " $_.starttime " bis " $_.endtime
			#"abwesend von:" | Out-File -FilePath "C:\temp\$displayname.txt" -encoding "default" 
			#$_ | Select starttime,endtime | Out-File -FilePath "C:\temp\$displayname.txt" -encoding "default" -append 
			#$OOFText | Out-File -FilePath "C:\temp\$displayname.txt" -encoding "default" -append
		}		
	}
}