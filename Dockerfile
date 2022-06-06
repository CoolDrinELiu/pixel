FROM ruby:3.1.2-alpine3.16

ENV BUNDLER_VERSION=2.2.32

RUN apk --no-cache add postgresql-client \
  vim \
  freetds-dev \
  yarn \
  wget \
  gcc \
  autoconf \
  libc-dev \
  linux-headers \
  make \
  libxml2-dev \
  libressl-dev \
  mysql-dev \
  postgresql-dev \
  libffi-dev \
  readline-dev \
  yaml-dev \
  tzdata \
  git \
  nodejs \
  less \
  curl \
  g++ \
  ca-certificates \
  imagemagick \
  nginx \
  build-base \
  ruby-dev \
  libxslt-dev \
  libcurl

RUN gem install bundler -v 2.2.32

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

RUN yarn cache clean && \
  rm -rf node_modules tmp/cache vendor/assets test && \
  rm -rf /home/app/rails-app/vendor/cache &&\
  rm -rf '/var/cache/apk/*' '/tmp/*'

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]