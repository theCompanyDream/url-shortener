FROM ruby:3.0.1-alpine3.13

# Move to workspace
WORKDIR /var/www

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
	&& rm -rf /var/cache/apk/*

# Copy Contents to workspace
COPY . .

# Install gems 'bundler' and 'rails'
RUN sh -c "gem install bundler && gem install rails -v 6.1.3 && gem install debase -- --with-cflags=\"-Wno-error=implicit-function-declaration\""

# Install local packages
RUN bundle install