# Monitor-Windows-App-Install-Notify
## Monitor application status on a windows machine and send email notification if any new application is installed.
## Introduction
This PowerShell script monitors the installation of new applications on a Windows machine and sends email notifications when new applications are detected. It can be useful for keeping track of software changes on your system.

## Prerequisites
Before using this script, ensure you have the following prerequisites:
- Windows operating system.
- PowerShell installed on your system.

## Configuration

You need to configure the script by updating the following variables with your specific information:

```powershell
$smtpServer = "smtp.gmail.com"                          # SMTP server address
$smtpPort = 587                                         # SMTP server port
$smtpUsername = "shajibulislamnayem19@gmail.com"        # Your SMTP username
$smtpPassword = "gcxt anjo hdnw wuzd"                   # Your SMTP password
$senderEmail = "shajibulislamnayem19@gmail.com"         # Sender's email address
$recipientEmail = "sinayem88@gmail.com"                 # Recipient's email address
$subject = "New Application Installed"                  # Email subject
```
Clone or download this repository and configure the script by updating the email settings and other parameters in the script as needed. <br>
<br>
<br>
**Run the script using PowerShell.** <br>
<img width="391" alt="image" src="https://github.com/sinayem/Monitor-Windows-App-Install-Notify/assets/68912545/a4eeeef8-f5b5-4a61-aba2-be433f6d5080"> <br>
### NOTE: This manual process can be automated by Windows Task Scheduler.

If an application is installed within 120 seconds, this script will send an email notification.<br>
<br>
**Finally, this is the email I received:** <br>
<img width="462" alt="image" src="https://github.com/sinayem/Monitor-Windows-App-Install-Notify/assets/68912545/7da0f11c-a867-4d40-9528-75a5d4cd7bf9">
