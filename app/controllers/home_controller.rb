class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :callback

  def callback
    @auth_hash = request.env["omniauth.auth"]
  end
end
