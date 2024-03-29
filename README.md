ruby -v                                   
ruby 3.1.4p223 (2023-03-30 revision 957bb7cb81) [arm64-darwin23]

[ruby-]1.8.6[-p420]
[ruby-]1.8.7[-head] # security released on head
[ruby-]1.9.1[-p431]
[ruby-]1.9.2[-p330]
[ruby-]1.9.3[-p551]
[ruby-]2.0.0[-p648]
[ruby-]2.1[.10]
[ruby-]2.2[.10]
[ruby-]2.3[.8]
[ruby-]2.4[.10]
[ruby-]2.5[.9]
[ruby-]2.6[.10]
[ruby-]2.7[.8]
[ruby-]3.0[.6]
[ruby-]3.1[.4]
[ruby-]3.2[.3]
[ruby-]3[.3.0]

brew install libpq
Homebrew's package for the PostgreSQL client tools is libpq, which includes psql, pg_dump, and other client utilities.
Link all binaries of libpq to /usr/local/bin.
brew link --force libpq
https://docs.risingwave.com/docs/current/install-psql-without-postgresql/

padrino g project padrino-erp -d datamapper -a postgres -t rspec
padrino g project padrino-erp -d activerecord -a postgres -t rspec

cd ./padrino-erp && bundle --binstubs && bundle add rackup

bundle remove rake

bundle add rake -v "13.0.6"

bundle add rackup
bundle add slim
padrino s

padrino g admin -e slim

echo 'export PATH="/opt/homebrew/Cellar/libpq/bin:$PATH"' >> ~/.zshrc

ln -s /opt/homebrew/Cellar/libpq/16.2_1/bin/psql /usr/local/bin/psql

sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
locate pg_config

#RUN bundle config set build.do_postgres --with-pg-config=/opt/homebrew/Cellar/libpq/16.2_1/bin/pg_config

gem install pg -- --with-pg-config=/opt/homebrew/Cellar/libpq/16.2_1/bin/pg_config
bundle --binstubs

podman machine start
podman build -t padrino-erp .
podman run -p 3000:3000 padrino-erp


FROM ruby:3.1.0
# Install the necessary libraries
RUN apt-get update -qq && apt-get install -y postgresql-client
https://dev.to/betosardinha/dj-1-creating-a-rails-api-with-postgres-and-docker-2fgn
https://stackoverflow.com/questions/55744732/postgres-installation-on-docker-ruby-alpine

Could not find PostgreSQL build environment (libraries & headers): Makefile not
postgres.h... no


podman run -d --name db-postgres \
	-e POSTGRES_PASSWORD=123456 \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v /Users/ealarcop/datadir:/var/lib/postgresql/data \
    -p 5432:5432 \
	postgres

docker pull bonitasoft/bonita-postgres
podman run -d --name bonita-postgres -p 5434:5432 -v /Users/ealarcop/Projects/bonita/datadir:/var/lib/postgresql/data bonitasoft/bonita-postgres
podman run --name=bonita --env-file=env.txt -d -p 8090:8080 bonita

podman inspect <IdContainer> | grep IPAddress


https://railskey.wordpress.com/2013/08/02/padrino-installation-and-develop-demo-application/