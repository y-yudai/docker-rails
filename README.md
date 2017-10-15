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
$ mkdir myapp
$ cp -r docker-rails/* myapp/
$ cd myapp/
```

Create rails project.

```
$ docker-compose run web rails new . -f -d mysql -BT --skip-coffee --skip-turbolinks
```

Add webpacker and foreman to Gemfile.

```diff
+ gem 'webpacker', '~> 3.0'
+ gem 'foreman', group: :development
```

Build docker container.

```
$ docker-compose run web bundle install
$ docker-compose build
```

Install Vue.js with webpacker.

```
$ docker-compose run web rails webpacker:install
$ docker-compose run web rails webpacker:install:vue
```

DB default host rewrite db in instead of localhost in config/database.yml.

```diff
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
-  host: localhost
+  host: db
```

Create database.

```
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
```

Start docker containers.

```
$ docker-compose up
```

Open http://localhost:3000.

Enjoy hacking!!

## Troubleshooting

### Webpack binstubs not found

```
$ docker-compose run web bundle binstubs webpacker --path=bin/
```
