docker-compose down
docker-compose build
docker-compose run --rm web rails assets:precompile
docker-compose run --rm web rails db:migrate
docker-compose up -d
sudo systemctl restart nginx.service

sudo chown -R 991:991 /home/mastodon/mastodon/public/system
