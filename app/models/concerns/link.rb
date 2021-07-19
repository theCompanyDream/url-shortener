class Link

	include ActiveModel::Model

	attr_accessor :url, :expire, :slug

	validates :url, presence: true
	# validates_uniqueness_of :slug 
	# validates :url, format: URI::regexp(%w[http https]) 
	validates :expire, numericality: { only_integer: true }
	# validates :slug, with /[-A-Za-z01234567890]/

	def initialize(url, expire=3000, slug=nil)
		@url = url
		@expire = expire
		puts "wtf #{slug} #{url}  "
		@slug = slug ? slug : SecureRandom.uuid[0..5]
	end

end