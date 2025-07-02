# Dockerfile
FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["./entrypoint.sh"]
