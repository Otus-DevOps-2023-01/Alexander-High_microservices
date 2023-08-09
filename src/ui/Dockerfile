FROM ubuntu:20.04

ENV APP_HOME /app
RUN mkdir $APP_HOME

RUN apt-get update 
RUN apt-get install -y ruby-full ruby-dev build-essential 
RUN gem install bundler 
RUN rm -rf /var/lib/apt/lists/*



WORKDIR $APP_HOME
COPY Gemfile* /app/
RUN bundle install
COPY . /app/

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
