require 'rethinkdb'

include RethinkDB::Shortcuts

$rdb = r.connect(
	:host => ENV['RETHINK_HOST'],
	:port => ENV['RETHINK_PORT'],
	:db => ENV['RETHINK_NAME'],
	# :user => ENV['RETHINK_USER'],
	# :password => ENV['RETHINK_PASSWORD']
)

databases = r.db_list().run($rdb)

if ENV['RETHINK_NAME'] in databases
	r.db_create(ENV['RETHINK_NAME']).run($rdb)
	r.db(ENV['RETHINK_NAME']).table_create(ENV['RETHINK_NAME']).run($rdb)
end