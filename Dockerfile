FROM ruby:3.1-alpine

ARG PRECOMPILEASSETS

ENV NODE_OPTIONS "--max_old_space_size=4096"
ENV SECRET_KEY_BASE=foo

RUN apk add --update --no-cache \
    build-base \
    git \
    postgresql-dev \
    postgresql-client \
    imagemagick \
    nodejs-current \
    yarn \
    python2 \
    tzdata \
    file

WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s"]
