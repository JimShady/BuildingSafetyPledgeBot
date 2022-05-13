library("rtweet")
library("readr")
library("lubridate")
library("glue")
library("dplyr")

# Create Twitter token
remediationbot_token <- create_token(
  app = "BuildingSafetyPledgeBot",
  consumer_key =    Sys.getenv("TWITTER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_API_KEY_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET"),
  set_renv = FALSE
)

builders_yet_to_sign <- read_csv("builders_yet_to_sign.csv", col_types = cols())

days_since <- as.Date("2022-04-12", format = "%Y-%m-%d")

i <- sample(1:nrow(builders_yet_to_sign),1)

days <- today() - days_since

builders <- builders_yet_to_sign[i,]$twitter_handles

#Post the image to Twitter
post_tweet(
  status = glue("It has been {days} days since the UK's largest homebuilders agreed to pay to fix the defective buildings they built. Why are {builders} not on the list? #endourcladdingscandal #buildingsafetycrisis https://www.gov.uk/guidance/list-of-developers-who-have-signed-building-safety-repairs-pledge"), # nolint
  #media = temp_file,
  token = remediationbot_token
)