#' Search Tweets
#'
#` Search the attack tweets oon the Tweeter API.
#'@param name The attack name
#'@export
searchTweets <- function(name){
  require(twitteR)
  require(RCurl)

  consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
  consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
  access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
  access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  1

  ltw <- list()
  for (x in 1:3){
    searchResults <- searchTwitter(name, since='2017-05-07', sinceID=x*1000, n=1000)
    ltw[[x]] <- twListToDF(searchResults)
  }
  df.tw <- plyr::ldply(ltw)
  saveRDS(df.tw, file = name)
}

