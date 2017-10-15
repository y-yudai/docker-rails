# Docker Rails

Rails + MySQL + Vue.js in Docker container.

* Debian 8
* Rails 5+
* Ruby 2.4.2
* MySQL 5.7
* Yarn
* Node.js 6+
* Vue.js

## Usage

### 1. Create rails application

Rewrite `/your_app_name` in instead of `/myapp` in docker-compose.yml and Dockerfile before run `rails new`.

```
$ git clone git@github.com:aocha/docker-rails.git
$ cd docker-rails
$ docker-compose run web rails new . -f -TB -d mysql --skip-turbolinks --skip-coffee
```

### 2. Install require gems

```
$ echo "gem 'webpacker', '~> 2.0'" >> Gemfile
$ echo "gem 'foreman', group: :development" >> Gemfile
$ docker-compose run web bundle install
$ docker-compose build
```

### 3. Create database

Rewrite `host: db` in instead of `host: localhost` in config/database.yml before run `rails db:create`.

```
$ docker-compose run web rails db:create
```

### 4. Use Vue.js with webpacker

```
$ docker-compose run web rails webpacker:install
$ docker-compose run web rails webpacker:install:vue
```

### 5. Setting foreman

Create `Procfile.dev` root directory. Then, Rewrite `command: foreman start -f Procfile.dev` in instead of `command: bundle exec rails s -p 3000 -b 0.0.0.0` in docker-compose.yml.

```
# Procfile.dev
web: bundle exec rails s -p 3000 -b 0.0.0.0
webpack: bin/webpack-dev-server
```

### 6. Start docker containers

```
$ docker-compose up
```

Open http://localhost:3000.
