class ErrorsController < BaseController
  def not_found
    render status: :not_found
  end

  def server_error
    render status: :internal_server_error
  end

  def not_authorized
    render status: :unauthorized
  end
end
