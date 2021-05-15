require 'redis'
require 'digest/sha1'

class ApplicationController < ActionController::API
	def index
		render json: { 'data' => 'hello world'}
	end

	def create_hash
		url = params[:url]
		expire = params[:expire]
		slug = params[:slug]

		if url == nil
			raise ActionController::RoutingError.new('URL Not found')
		end

		if slug
			$redis.set(slug, url)
			$redis.expire(slug, expire ? expire : 10000)
		else
			$redis.set(url.hash, url)
			$redis.expire(url.hash, expire ? expire : 10000)
		end

		render json: {'hash': slug ? slug : url.hash}
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
