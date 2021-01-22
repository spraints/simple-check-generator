gh = [
  :github,
  ENV["GITHUB_KEY"],
  ENV["GITHUB_SECRET"],
  client_options: {
      site: "#{ENV["GITHUB_URL"]}/api/v3",
      authorize_url: "#{ENV["GITHUB_URL"]}/login/oauth/authorize",
      token_url: "#{ENV["GITHUB_URL"]}/login/oauth/access_token",
  },
  scope: "user,repo",
]
Rails.application.config.middleware.use OmniAuth::Builder do
  provider *gh
end