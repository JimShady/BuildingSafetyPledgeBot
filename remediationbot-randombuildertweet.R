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

builders <- read_csv("builders.csv", col_types = cols()) %>%
              filter(signed_pledge == 'No')

days_since <- as.Date("2022-04-12", format = "%Y-%m-%d")

i <- sample(1:nrow(builders),1)

days <- today() - days_since

builder_name <- builders[i,]$company_short_name
builder_twitter <- builders[i,]$twitter_handles

#Post the image to Twitter
if (is.na(builder_twitter)) {
    post_tweet(
    status = glue("{days} days ago the UK's largest homebuilders agreed to pay to fix the defective buildings they built. Why are {builder_name} not on the list? #endourcladdingscandal #buildingsafetycrisis https://www.gov.uk/guidance/list-of-developers-who-have-signed-building-safety-repairs-pledge"), # nolint
    #media = temp_file,
    token = remediationbot_token)
} else {
    post_tweet(
    status = glue("{days} days ago the UK's largest homebuilders agreed to pay to fix the defective buildings they built. Why are {builder_name} ({builder_twitter}) not on the list? #endourcladdingscandal #buildingsafetycrisis https://www.gov.uk/guidance/list-of-developers-who-have-signed-building-safety-repairs-pledge"), # nolint
    #media = temp_file,
    token = remediationbot_token)
}