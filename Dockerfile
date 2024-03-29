FROM ruby:3.1-slim

RUN apt update

#RUN apt install postgresql-client
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    libvips \
    libpq-dev \
    postgresql-client 

WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s"]
