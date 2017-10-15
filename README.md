# Docker Rails

Rails + MySQL + Vue.js in Docker container.

* Rails 5+
* Ruby 2.4.2
* MySQL 5.7
* Yarn
* Node.js 6+
* Vue.js

## Usage

```
$ docker-compose run web rails new . -f -d mysql -BT --skip-coffee --skip-turbolinks
$ docker-compose run web /bin/bash -c 'echo "gem 'webpacker', '~> 3.0'\ngem 'foreman', group: :development" >> Gemfile'
$ docker-compose run web bundle install
$ docker-compose build
```
