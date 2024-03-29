# FROM ruby:3.1-alpine

# ARG PRECOMPILEASSETS

# ENV NODE_OPTIONS "--max_old_space_size=4096"
# ENV SECRET_KEY_BASE=foo

# RUN apk add --update --no-cache \
#     build-base \
#     git \
#     postgresql-dev \
#     postgresql-client \
#     imagemagick \
#     nodejs-current \
#     yarn \
#     python2 \
#     tzdata \
#     file


ARG RUBY_VERSION=3.1

FROM ruby:${RUBY_VERSION}-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libvips \
    libpq-dev \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s"]
