# URL Shortener

A website used to shorten urls built in rails.

## Requirements

- Docker
- Docker-Compose
- Make

## Directions

Everything is in docker to make testing pretty seamless so just run.

```Makefile
	make
```

To run in debug mode

```bash
	gem install debase
	gem install ruby-debug-ide
```

## Future

I want to store a static list of slug names, or make permanent slugs I want to use rethinkdb to do this. There is a nice ruby port and I think this would be the perfect project to use Ruby.
