class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session

  before_action do
    request.format = :json
  end

  def authenticate_user!
    header = request.headers["authorization"] || ""
    api_token = header.gsub("Bearer ", "")
    @current_user = User.find_by api_token: api_token
    if @current_user.blank?
      render json: {status: "unauthorized", message: "Token missing or invalid"}, status: 401
    end
  end

end
