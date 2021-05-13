require 'redis'

class ApplicationController < ActionController::API
	def index
		render json: { 'meta' => 'hello world'}
	end

	def create_hash(url)
		hash = Hash.new(url)
		$redis.set(url)
	end

	def get_hash(hash)
		url = $redis.get(hash)
		redirect_to url
	end

	def delete_hash(hash)

	end
end
