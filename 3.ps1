##############################################################		
##   AUTHOR: Shajibul Islam Nayem			                ##
##  		 					                            ##
##   DATE: 21-09-23					                        ##
##							                                ##
##   Monitor application status on a Windows machine and    ##
##   Send email notification if any new application is      ##
##   installed.	     					                    ##
## 	                  				                        ##
##							                                ##	
##############################################################
#Define the email settings
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$smtpUsername = "shajibulislamnayem19@gmail.com"
$smtpPassword = "gcxt anjo hdnw wuzd"
$senderEmail = "shajibulislamnayem19@gmail.com"
$recipientEmail = "sinayem88@gmail.com"
$subject = "New Application Installed"

##############################################################
#Get the list of installed applications
$installedAppsBefore = Get-WmiObject -Class Win32_Product

###############################################################
#Wait for some time to allow for the installation of new applications (adjust as needed)
Start-Sleep -Seconds 120

###############################################################
# Get the list of installed applications again
$installedAppsAfter = Get-WmiObject -Class Win32_Product

###############################################################
# Compare the lists to find newly installed applications
$newlyInstalledApps = Compare-Object -ReferenceObject $installedAppsBefore -DifferenceObject $installedAppsAfter | where {$_.Match -ne '->'}

###############################################################
#Setup email
$smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential( $smtpUsername , $smtpPassword );
$msg = New-Object Net.Mail.MailMessage
$msg.To.Add($recipientEmail)
$msg.From = $senderEmail
$msg.Subject = 'new applications have been installed!! '
$header = "The following new applications have been installed:`r`n`r`n"
$msg.Body = $header + "`n"

################################################################
#If there are newly installed applications, send an email notification
if ($newlyInstalledApps) {
    $msg.Body += "Name: "+ $newlyInstalledApps.InputObject.Name +"`n"+ "Vendor: "+ $newlyInstalledApps.InputObject.Vendor +"`n" +"Version: "+ $newlyInstalledApps.InputObject.Version

    $smtp.Send($msg)
}
else{
    Write-Host "No new applications installed."
}

###############################################################
#End of script
