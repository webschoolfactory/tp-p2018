sudo mount /dev/cdrom /media/cdrom
cd /media/cdrom/
sudo apt-get update
sudo apt-get -y install build-essential
sudo ./VBoxLinuxAdditions.run
usermod -aG vboxsf $(whoami)