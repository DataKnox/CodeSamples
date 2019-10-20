#1. Have a common username, that also has sudo level access#
#2. Setup passwordless keys
#3. Enable SSH on remote hosts sudo apt-get install openssh-server

#INSTALL AND CONFIG

sudo apt update

sudo apt install software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update

sudo apt-get install ansible -y

#confirm working by running the ping module against localhost:
ansible localhost -m ping

###### REMOTE HOSTS #######
#create local hostnames in hosts file
sudo nano /etc/hosts

#create entry for 172.16.1.whatever  hostname
#Create SSH key on ansible server
ssh-keygen
#accept the defaults
#list the keys to verify
ls .ssh

#copy the key to other machines
ssh-copy-id -i .ssh/id_rsa.pub ubuntu
#note if refused, run:
#sudo apt-get install openssh-server

#Now configure sudo so that it doesnt require a password
ssh ubuntu1 
sudo visudo
#very bottom of file add this line:
knox ALL=(ALL) NOPASSWD: ALL

#then save and exit

###### INVENTORY #######
sudo nano /etc/ansible/hosts
#create GUI group like so at bottom of file
# [linuxhosts]
# ubuntu
# centos

## can also specify username to use like
# ubuntu1 ansible_user=administrator

ansible -m ping all

#raw module with the uptime action (-a)
ansible -m raw -a '/usr/bin/uptime' linuxhosts

ansible -m shell -a 'python3 -V' linuxhosts

ansible all -a 'whoami'
#elevate to root with -b for become. Why? Because ansible doesnt elevate to sudo by default
ansible all -b -a 'whoami'
#note not specifying a module like above it defaults to command module


##### NETWORKING ######
# Set environment variables for auth to devices
# cd to the directory
# source .ansible_env