FROM ruby:2.3-slim

ENV BUILD_PACKAGES="build-essential" \
    DEV_PACKAGES="libpq-dev postgresql-client" \
    APP_HOME="/var/www/lootcrate"

RUN \

  # linux packages
  apt-get update -qq && apt-get install -y $BUILD_PACKAGES $DEV_PACKAGES && \

  # app directory
  mkdir -p $APP_HOME && \

  # bundler
  gem install -N bundler

# gems link
WORKDIR $APP_HOME
ADD ./Gemfile* $APP_HOME/
RUN bundle install --jobs 20 --retry 3
ADD . $APP_HOME


# expose app server
EXPOSE 3000
