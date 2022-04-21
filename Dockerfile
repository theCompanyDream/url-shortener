FROM ruby:3.0.1-alpine3.13

# Move to workspace
WORKDIR /opt/www

# Update packages
RUN apk update

# Install packages
RUN apk add \
	gcc \
	g++ \
	make \
	curl \
	wget \
	zip \
	unzip \
	shared-mime-info  \
	tzdata \
	nodejs \
	yarn \
	&& rm -rf /var/cache/apk/*

# Copy Contents to workspace
COPY . .

# Install gems 'bundler'
RUN gem install bundler -v 2.2.31
# RUN gem install debugger -v 1.6.8
RUN gem install debase -- --with-cflags="-Wno-error=implicit-function-declaration"

RUN gem install rails -v 6.1.3

# Install local packages
RUN bundle install

# Install webpacker dependencies
RUN rails webpacker:install