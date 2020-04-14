Initialize robots:
docker-compose up -d
crontab -r
bundle install
rails robots:initialize
whenever --update-crontab --set environment='development'

Run tests
rails robots:test

Required:
crontab
ruby 2.7.0

Fix issue with pg gem:
sudo apt-get install libpq-dev