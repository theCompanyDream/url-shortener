# Run Yarn 
FROM node:alpine3.15 as node_builder

COPY ./package.json .

COPY ./yarn.lock .
# Build node dependencies
RUN yarn

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
	&& rm -rf /var/cache/apk/*

# Copy Contents to workspace
COPY . .

# Add Node modules
COPY --from=node_builder . .

# Install gems 'bundler'
RUN gem install bundler -v 2.2.31
# RUN gem install debugger -v 1.6.8
RUN gem install debase -- --with-cflags="-Wno-error=implicit-function-declaration"

# Install local packages
RUN bundle install