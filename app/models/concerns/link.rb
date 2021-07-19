class Link

	include ActiveModel::Model

	attr_accessor :url, :expire, :slug

	validates :url, presence: true
	# validates :url, with %w{http https}
	validates :expire, numericality: { only_integer: true }
	# validates :slug, with /[-A-Za-z01234567890]/

	def initialize(url, expire=3000, slug=nil)
		@url = url
		@expire = expire ? expire : 10000
		@slug = slug ? slug : url.hash
	end

end