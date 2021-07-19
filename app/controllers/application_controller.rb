require 'redis'
require 'digest/sha1'

class ApplicationController < ActionController::API
	def index
		render json: { 'data' => 'hello world'}
	end

	def create_hash

		link = Link.new( params[:url], params[:expire], params[:slug] )
		$redis.set(link.slug, link.url)
		$redis.expire(link.slug, link.expire)

		render json: {'hash': link.slug}
	end

	def get_hash
		hash = params[:id]

		if hash == nil
			raise ActionController::RoutingError.new('Hash Not found')
		end

		url = $redis.get(hash)
		redirect_to url
	end

	def delete_hash
		slug = params[:id]

		if hash == nil
			raise ActionController::RoutingError.new('Hash Not found')
		end

		$redis.del(slug)
	end
end
