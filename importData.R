# load the stingi library
library(stringi)

# import the blogs and twitter datasets 
blogs <- readLines("data/en_US/en_US.blogs.txt", encoding="UTF-8")
twitter <- readLines("data/en_US/en_US.twitter.txt", encoding="UTF-8")

# for efficiency, import the news dataset in binary mode
con <- file("data/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8")
close(con)
rm(con)

# fix some non UTF-8 characters by dropping them.
twitter <- iconv(twitter, from = "latin1", to = "UTF-8", sub="")
twitter <- stri_replace_all_regex(twitter, "\u2019|`","'")
twitter <- stri_replace_all_regex(twitter, "\u201c|\u201d|u201f|``",'"')

# save the data to an .RData files
save(blogs, file="blogs.RData")
save(news, file="news.RData")
save(twitter, file="twitter.RData")