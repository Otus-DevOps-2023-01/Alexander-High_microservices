FROM ubuntu:16.04 
RUN apt-get update
RUN apt install -y ruby-full ruby-dev build-essential
RUN gem install bundler -v 1.17.2
ENV APP_HOME /app

RUN mkdir $APP_HOME 

WORKDIR $APP_HOME
COPY Gemfile* /app/ 

RUN bundle update --bundler
RUN bundle install

COPY . $APP_HOME
ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment 
ENV COMMENT_SERVICE_PORT 9292 

CMD ["puma"]
