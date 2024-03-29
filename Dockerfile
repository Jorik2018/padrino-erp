FROM easyredir/ruby:3.1

ENV DEBIAN_FRONTEND noninteractive
ENV PG_MAJOR 16

RUN curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > /usr/share/keyrings/postgresql.gpg
RUN sh -c 'echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/postgresql.list'

RUN apt-get update \
	&& apt-get install -y postgresql-client-$PG_MAJOR \
	&& rm -rf /root/* \
	&& rm -rf /tmp/* \
	&& rm -rf /var/cache/apt/archives/*.deb \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s"]
