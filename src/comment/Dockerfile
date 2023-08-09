FROM ruby:2.2
RUN apt-get update -qq
RUN apt install -y build-essential

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* /app/
RUN bundle install
COPY . /app

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
