Initialize robots:
crontab -r
rails robots:initialize
whenever --update-crontab --set environment='development'

Run tests
rails robots:test