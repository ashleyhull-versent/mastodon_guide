echo "Prepare and update OS"
sudo apt-get --yes install language-pack-en 
sudo apt-get --yes update && sudo apt-get --yes upgrade && sudo apt-get --yes dist-upgrade

##############################################################
sudo reboot now
##############################################################

##############################################################
echo "Create mastodon user/group"
##############################################################
sudo addgroup -gid 991 mastodon
sudo adduser --quiet --disabled-password --gid 991 --uid 991 mastodon
sudo usermod -aG sudo mastodon
echo "mastodon:changeme" | sudo chpasswd

##############################################################
echo "Install Docker and docker-compose"
##############################################################
sudo apt --yes install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt --yes install docker-ce
sudo usermod -aG docker mastodon

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

##############################################################
echo "Activate Swap"
##############################################################
sudo fallocate -l 5G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

##############################################################

