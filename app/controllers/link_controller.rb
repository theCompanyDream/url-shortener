class LinkController < ActionController::Base
	def create_update_slug
		link = Link.new( params[:url], params[:expire], params[:slug] )
		link.store()
		link.long_store()
		render json: {'slug': link.slug}
	end

	def get_slug
		slug = params[:id]

		url = Link::get_slug(slug)

		if url == nil
			raise ActionController::RoutingError.new('Url Not Found')
		end

		redirect_to url
	end

	def delete_slug
		slug = params[:id]

		Link::delete_slug(slug)
	end
end