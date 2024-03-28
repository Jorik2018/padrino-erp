# Use a base image with Ruby 3.1 installed
FROM ruby:3.1

RUN sudo apt update

RUN sudo apt install postgresql-client

# Set the working directory in the container
WORKDIR /app

# Copy your application files to the container
COPY . .

# Install your application dependencies
RUN bundle install

# Specify the command to run your application
CMD ["padrino", "s"]
