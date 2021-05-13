require 'redis'

class ApplicationController < ActionController::API
	def home 
		render json: { 'meta' => 'hello world'}
	end

	def create_hash(url)

	end

	def get_hash()

	end
end
