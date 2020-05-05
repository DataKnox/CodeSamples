
<#
https://www.siteground.com/kb/google_free_smtp_server/
    Outgoing Mail (SMTP) Server: smtp.gmail.com
    Use Authentication: Yes
    Use Secure Connection: Yes (TLS or SSL depending on your mail client/website SMTP plugin)
    Username: your Gmail account (e.g. user@gmail.com)
    Password: your Gmail password
    Port: 465 (SSL required) or 587 (TLS required)
#>

Send-MailMessage -From 'knox.hutchinson@cbtnuggets.com'`
    -To 'knox@knoxsdata.com' `
    -Subject 'Data Knox YouTube Channel' `
    -Body "Go check it out - https://youtube.com/c/Dataknox" `
    -Attachments .\data.csv `
    -Priority High `
    -DeliveryNotificationOption OnSuccess, OnFailure `
    -SmtpServer 'smtp.gmail.com' `
    -Port 587 `
    -UseSsl `
    -Credential (Get-Credential)
