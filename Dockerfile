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


# ARG RUBY_VERSION=3.1
# FROM ruby:${RUBY_VERSION}-slim
# RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
#     build-essential \
#     gnupg2 \
#     curl \
#     less \
#     git \
#     libvips \
#     libpq-dev \
#     postgresql-client \
#   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# RUN find / -name "postgres.h" -print


FROM ruby:3.1

# Install essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# Install PostgreSQL client tools using Homebrew
RUN apt-get update && apt-get install -y \
    postgresql-client \
 && rm -rf /var/lib/apt/lists/*

# Link binaries of libpq to /usr/local/bin
RUN ln -s /usr/bin/psql /usr/local/bin/psql \
 && ln -s /usr/bin/pg_dump /usr/local/bin/pg_dump \
 && ln -s /usr/bin/pg_restore /usr/local/bin/pg_restore \
 && ln -s /usr/bin/createdb /usr/local/bin/createdb \
 && ln -s /usr/bin/createlang /usr/local/bin/createlang \
 && ln -s /usr/bin/clusterdb /usr/local/bin/clusterdb \
 && ln -s /usr/bin/dropdb /usr/local/bin/dropdb \
 && ln -s /usr/bin/droplang /usr/local/bin/droplang \
 && ln -s /usr/bin/dropuser /usr/local/bin/dropuser \
 && ln -s /usr/bin/reindexdb /usr/local/bin/reindexdb \
 && ln -s /usr/bin/vacuumdb /usr/local/bin/vacuumdb \
 && ln -s /usr/bin/createuser /usr/local/bin/createuser \
 && ln -s /usr/bin/oid2name /usr/local/bin/oid2name \
 && ln -s /usr/bin/pg_basebackup /usr/local/bin/pg_basebackup \
 && ln -s /usr/bin/pg_archivecleanup /usr/local/bin/pg_archivecleanup \
 && ln -s /usr/bin/pg_config /usr/local/bin/pg_config \
 && ln -s /usr/bin/pg_controldata /usr/local/bin/pg_controldata \
 && ln -s /usr/bin/pg_ctl /usr/local/bin/pg_ctl \
 && ln -s /usr/bin/pg_dumpall /usr/local/bin/pg_dumpall \
 && ln -s /usr/bin/pg_isready /usr/local/bin/pg_isready \
 && ln -s /usr/bin/pg_recvlogical /usr/local/bin/pg_recvlogical \
 && ln -s /usr/bin/pg_receivewal /usr/local/bin/pg_receivewal \
 && ln -s /usr/bin/pg_resetwal /usr/local/bin/pg_resetwal \
 && ln -s /usr/bin/pg_standby /usr/local/bin/pg_standby \
 && ln -s /usr/bin/pg_test_fsync /usr/local/bin/pg_test_fsync \
 && ln -s /usr/bin/pg_test_timing /usr/local/bin/pg_test_timing \
 && ln -s /usr/bin/pg_upgrade /usr/local/bin/pg_upgrade \
 && ln -s /usr/bin/pg_xlogdump /usr/local/bin/pg_xlogdump \
 && ln -s /usr/bin/pgbench /usr/local/bin/pgbench \
 && ln -s /usr/bin/pgmetrics /usr/local/bin/pgmetrics
 
WORKDIR /app

COPY . .

COPY config/database.yml.example config/database.yml

RUN bundle install

EXPOSE 3000

CMD ["padrino", "s"]