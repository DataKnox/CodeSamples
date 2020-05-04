# Does this work?
Set-AdAccountPassword -Identity candy.spoon -NewPassword (ConvertTo-SecureString -AsPlainText "MyPw!22222aaaa" -Force)

#Why did this work?
Set-AdAccountPassword -Identity candy.spoon -NewPassword (ConvertTo-SecureString -AsPlainText "MyPw!22222aaaa" -Force) -Reset

#Look at the Identity Property - what object type does it take?
Set-AdAccountPassword -Identity

Get-AdUser -Identity candy.spoon

Get-AdUser -Identity candy.spoon | Select-Object *

$candy = Get-AdUser -Identity candy.spoon | Select-Object *
$candy
$candy.PropertyNames