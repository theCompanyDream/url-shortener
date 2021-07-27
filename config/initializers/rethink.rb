require "rethinkdb"

$rdb = r.connect(
	:host => ENV['RETHINK_HOST'],
	:port => ENV['RETHINK_PORT'],
	:db => ENV['RETHINK_NAME'],
	:user => ENV['RETHINK_USER'],
	:password => ENV['RETHINK_PASSWORD']
)