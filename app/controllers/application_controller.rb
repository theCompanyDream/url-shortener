require 'redis'

class ApplicationController < ActionController::API
	def index
		render json: { 'data' => 'hello world'}
	end

	def create_hash
		link = Link.new( params[:url], params[:expire], params[:slug] )
		link.store()
		render json: {'hash': link.slug}
	end

	def get_hash
		hash = params[:id]

		url = Link::get_hash(hash)

		redirect_to url
	end

	def delete_hash
		slug = params[:id]

		Link::delete_hash(slug)
	end
end
