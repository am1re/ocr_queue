# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y tesseract-ocr

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

COPY webapi-startup.sh .
RUN mkdir /etc/services.d/webapi
# RUN cp /myapp/webapi-startup.sh /etc/services.d/webapi/run
RUN ln -s /myapp/webapi-startup.sh /etc/services.d/webapi/run
RUN chmod +x /etc/services.d/webapi/run

COPY worker-startup.sh .
RUN mkdir /etc/services.d/worker
# RUN cp /myapp/worker-startup.sh /etc/services.d/worker/run
RUN ln -s /myapp/worker-startup.sh /etc/services.d/worker/run
RUN chmod +x /etc/services.d/worker/run

EXPOSE 3000

ENTRYPOINT ["/init"]
