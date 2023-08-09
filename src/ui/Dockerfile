FROM ubuntu:16.04

ENV APP_HOME /app
RUN mkdir $APP_HOME
RUN apt-get update \
RUN apt-get install -y ruby-full ruby-dev build-essential \
RUN gem install bundler --no-ri --no-rdoc \
RUN rm -rf /var/lib/apt/lists/*



WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
