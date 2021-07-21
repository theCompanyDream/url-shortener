require 'redis'

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

	def self.get_slug(slug)
		if slug == nil
			raise ActionController::RoutingError.new('Slug is empty')
		end

		url = $redis.get(slug)

		return url
	end

	def store()
		if Link::get_slug(@slug) == nil
			$redis.set(@slug, @url)
			$redis.expire(@slug, @expire)
			
		end
	end

	def self.delete_slug(slug)
		if hash == nil
			raise ActionController::RoutingError.new('Slug not found')
		end

		$redis.del(slug)
	end

end