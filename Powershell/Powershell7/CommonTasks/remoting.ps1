Enable-PSRemoting

#Remotely enter a computer
Enter-PSSession
Get-Service
Exit-PSSession

#Run commands remotely
Invoke-Command dc-nug { Get-Service }

#Run GP Updates
Invoke-GPUpdate dc-nug
Get-ADComputer -Filter * | ForEach-Object { Invoke-GpUpdate -Computer $_.name -Force }

##### LINUX
<#
sudo apt install openssh-client
sudo apt install openssh-server
nano /etc/ssh/sshd_config
Subsystem powershell /usr/bin/pwsh -sshs -NoLogo -NoProfile
sudo service sshd restart

Enter-PSSession -HostName lnx-nug -UserName nuguser
#>