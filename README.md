# HACKATHON SYSTEM
[![Heroku App Status](http://heroku-shields.herokuapp.com/hackatona-projarq)](https://hackatona-projarq.herokuapp.com/)
>https://hackatona-projarq.herokuapp.com/

>Authors: Henrique K. - João C. - João S.

>Chosen architectural pattern: MVC

This project is emulating a simple CMS over the hackathon context made in Ruby on Rails.

#

## Funcional requirements

* Inscriptions
  * Subscribe
  * Unsubscribe

* Teams
  * Team suggestion
  * Team validation
  * Team creation
  * Team exclusion
  * Include member
  * Exclude member

* Appraisers
  * Evaluate a team (with the evaluation form)
  
* Generate evaluation form
  * Working software [ 0 - 5 ]
  * Process [ 0 - 5 ]
  * Pitch [ 0 - 5 ]
  * Inovation [ 0 - 5 ]
  * Team formation [ 0 - 5 ]

#

## Non-functional requirements

**Maintainability**

- modularity
  
- reusability
  
- analyzability
  
- changeability
  
- modificability
  
- testability

#

## Technologies

* Ruby on Rails (Server-side)
* Bootstrap (Client-side)
* PostgreSQL (Database)
* Heroku (PAAS)

#

## Database structure

| Entity | Fields | Actions |
| ---------- | ---------- | ---------- |
| Student | name <br> **pk_unique_key** <br> **fk_team_subscribed** <br> **fk_team_suggested** <br> **fk_college_course** | Subscribe <br> Unsubscribe |
| Team | name <br> **pk_unique_key** | Create <br> Exclude <br> Subscribe student <br> Unsubscribe student | 
| Appraiser | name <br> **pk_unique_key** | Subscribe <br> Unsubscribe |
| Evaluation | working_software <br> process <br> pitch <br> innovation <br> team_formation <br> **pk_unique_key** <br> **fk_team** <br> **fk_appraiser** | None |
| College_course | Name <br> **pk_unique_key** | Subscribe <br> Unsubscribe |

#

## Deploy

The project can be manually deployed on: 
https://dashboard.heroku.com/apps/hackatona-projarq/deploy/github

#

## Setup

For using this application locally, you will need to have installed PostgreSQL and Rails. For that, you may run the following commands:

**Server side on MacOS X**

```
# Rbenv
$ brew install rbenv ruby-build

# Ruby 2.5.0
$ rbenv install 2.5.0

# Rails
$gem install rails --no-document

# Dependencies (project path)
$ bundle install

# PostgreSQL
$ brew install postgresql

# Migrate databases
$ rails db:migrate
    If this command fails:
        $ rake db:drop db:setup db:migrate

# Run PostgreSQL as daemon
$ pg_ctl -D /usr/local/var/postgres start

# Start server
$ rails server
```

**Server side on Linux**

PostgreSQL
```
sudo apt install postgresql-11 libpq-dev
```

Installing with ```rbenv``` is a simple two step process. First you install ```rbenv```, and then ```ruby-build```
```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```
In the project root:
```
rbenv install 2.5.0
ruby -v
```

Install Bundler
```
gem install bundler
rbenv rehash
```

Install project dependencies
```
bundle install
rbenv rehash
```

Migrate databases
```
rails db:migrate
```
If migrate fails:
```
rake db:drop db:setup db:migrate
```

Start server
```
rails server
```
