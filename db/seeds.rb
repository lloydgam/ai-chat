Doorkeeper::Application.find_or_create_by!(uid: ENV["OAUTH_CLIENT_ID"]) do |app|
  app.name = "CLI Tool"
  app.secret = ENV["OAUTH_CLIENT_SECRET"]
  app.redirect_uri = "https://localhost/callback"
end
