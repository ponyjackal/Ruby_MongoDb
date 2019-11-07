class Api::V1::ApiController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render json: {error: 'Permission denied'}, status: 403, layout: false
  end
end
