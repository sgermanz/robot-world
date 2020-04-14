# ROBOTS OVERVIEW
### TASKS:
* ./config/schedule.rb
To schedule tasks I use "whenever" gem that transforms schedule.rb specification to crontab tasks.

* ./lib/tasks/robots.rake
Each specification runs a defined task in robots.rake 

* ./lib/robots
Includes all utility classes used by tasks

### CONFIGURATION:
./db/seeds.rb
Defines: 
- 10 CarModels with random costs and prices
- Random min stock for each CarModel
- buyer schedule each 10 minutes
- maximun amount of order changes of 1

The rest of the schedule times are fixed on schedule.rb according to the challenge documentation
- ./lib/robots/slack-services.rb includes a variable for the slack incoming webhook

### Installation

```sh
#runs the postgres container and an adminer dashboard
$ docker-compose up -d
#removes every existing crontab tasks
$ crontab -r
$ bundle install
#database creation, migration and seed
$ rails robots:initialize
#creates crontab tasks
$ whenever --update-crontab --set environment='development'
```
### Fix issue with pg gem:
```sh
$ sudo apt-get install libpq-dev
```
### DATABASE:
Credentials
```sh
username: robot
password: world
database: robot_world
```
Warehouse Stock statuses
```sh
new: item that passed all the assembly stages
moved: item moved to store
```
Store Stock statuses
```sh
new: item just added on the store stock
sold: item that is no longer part of any stock and has a related order
returned: item that came back to the stock store and has a related change order
```

### LOGFILE:
* ./log/robots.log
Stores logs from every running robot task

### TESTS
```sh
#runs a migration and runs the tests
$ rails robots:test
```

### REQUIREMENTS:
```sh
crontab
ruby 2.7.0
```