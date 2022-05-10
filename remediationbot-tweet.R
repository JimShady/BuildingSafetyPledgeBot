# Create Twitter token
remediationbot_token <- rtweet::create_token(
  app = "BuildingSafetyPledgeBot",
  consumer_key =    Sys.getenv("TWITTER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_API_KEY_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET"),
  set_renv = FALSE
)

# Post the image to Twitter
rtweet::post_tweet(
  status = "Testing local deployment",
  #media = temp_file,
  token = remediationbot_token
)
