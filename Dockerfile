FROM ruby:2.4.2

ENV LANG C.UTF-8
ENV APP_HOME /myapp

RUN apt-get update -qq && \
  apt-get install -y \
    build-essential \
    apt-transport-https

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install yarn

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

# Cache bundle
WORKDIR /tmp
COPY Gemfile* /tmp/
RUN bundle install

RUN mkdir -p ${APP_HOME}
WORKDIR ${APP_HOME}
ADD . ${APP_HOME}
