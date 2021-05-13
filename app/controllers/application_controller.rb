require 'redis'

class ApplicationController < ActionController::API
	def index
		render json: { 'meta' => 'hello world'}
	end

	def create_hash
		url = params[:url]
		hash = Hash.new(url)
		$redis.set(hash)
	end

	def get_hash
		hash = params[:hash]

		if hash == nil
			
		end

		url = $redis.get(hash)
		redirect_to url
	end

	def delete_hash(hash)

	end
end
