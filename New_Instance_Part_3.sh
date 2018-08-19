##############################################################
echo "Install nginx"
##############################################################
sudo apt-get --yes install nginx
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-available/mastodon
sudo ln -s /etc/nginx/sites-available/mastodon /etc/nginx/sites-enabled/mastodon

##############################################################
echo "Configure nginx"
##############################################################
sudo nano /etc/nginx/sites-available/mastodon

##############################################################
echo "Install certbot"
##############################################################
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get --yes install python-certbot-nginx

##############################################################
echo "Configure certbot"
##############################################################
sudo systemctl stop nginx.service
sudo certbot certonly -d example.com

sudo systemctl start nginx.service


