require 'redis'
require 'rethinkdb'

include RethinkDB::Shortcuts

class Link

	include ActiveModel::Model

	attr_accessor :url, :expire, :slug

	validates :url, presence: true
	# validates :url, format: URI::regexp(%w[http https]) 
	validates :expire, numericality: { only_integer: true }
	# validates :slug, with /[-A-Za-z01234567890]/

	def initialize(url, expire=3000, slug=nil)
		@url = url
		@expire = expire
		@slug = slug ? slug : SecureRandom.uuid[0..5]
	end

	def long_store
		store = r.table(ENV['RETHINK_HOST']).get(@slug).run($rdb)

		if store then
			store.replace({
				:url => @url,
				:expire => @expire,
				:slug => @slug
			}).run($rdb)
		else
			r.table(ENV['RETHINK_HOST']).insert({
				:url => @url,
				:expire => @expire,
				:slug => @slug
			}).run($rdb)
		end
	end

	def store
		if Link::get_slug(@slug) == nil
			$redis.set(@slug, @url)
			$redis.expire(@slug, @expire)
		end
	end

	def self.get_slug(slug)
		if slug == nil
			raise ActionController::RoutingError.new('Slug is empty')
		end

		url = $redis.get(slug)

		return url
	end

	def self.delete_slug(slug)
		if hash == nil
			raise ActionController::RoutingError.new('Slug not found')
		end

		$redis.del(slug)
	end

end