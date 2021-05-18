FROM ruby:2.6-stretch

RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn