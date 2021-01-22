require "sinatra"

require "omniauth-github"
require "byebug"

enable :sessions

class Debug
  def initialize(app)
    @app = app
  end

  def call(env)
    byebug
    @app.call(env)
  end
end

#use Debug

use OmniAuth::Builder do
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"],
    client_options: {
      site: "#{ENV["GITHUB_URL"]}/api/v3",
      authorize_url: "#{ENV["GITHUB_URL"]}/login/oauth/authorize",
      token_url: "#{ENV["GITHUB_URL"]}/login/oauth/access_token",
    },
    scope: "user,repo"
end

get "/" do
  erb :home
end

get "/auth/:result" do
  erb :auth_result
end

post "/auth/github/callback" do
  params[:result] = "success!"
  erb :auth_result
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end
