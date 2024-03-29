FROM ruby:3.1.1-alpine3.15
RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev

WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s", "-h", "0.0.0.0", "-p", "3000"]