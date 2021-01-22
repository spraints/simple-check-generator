require "sinatra"

require "omniauth-github"

enable :sessions

use OmniAuth::Builder do
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"], {
    client_options: {
      site: "#{ENV["GITHUB_URL"]}/api/v3",
      authorize_url: "#{ENV["GITHUB_URL"]}/login/oauth/authorize",
      token_url: "#{ENV["GITHUB_URL"]}/login/oauth/access_token",
    }
  }
end

get "/" do
  erb :home
end
