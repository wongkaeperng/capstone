# load relevant libraries for the job
library(tm)
library(openNLP)
library(RWeka)

# load data
load("blogs.RData")
load("news.RData")
load("twitter.RData")

# sample data (100,000 of each)
sample_blogs   <- sample(blogs, 1000)
sample_news    <- sample(news, 1000)
sample_twitter <- sample(twitter, 1000)

# remove profanity from the sample data
profanity <- read.csv("profanity.csv", header=FALSE)
profanity <- profanity$V1

# remove all profanity words
sample_blogs <- gsub(paste(profanity, collapse='|'), " ", sample_blogs)
sample_news <- gsub(paste(profanity, collapse='|'), " ", sample_news)
sample_twitter <- gsub(paste(profanity, collapse='|'), " ", sample_twitter)

# combine the data
combinedData <- c(sample_blogs,sample_news,sample_twitter)

# convert to VCorpus for easy manipulation
#combinedDataV <- VCorpus(VectorSource(combinedData), readerControl = list(language="en_US"))

# remove white spaces 
#combinedDataV <- tm_map(combinedDataV, stripWhitespace)

# remove numbers
#combinedDataV <- tm_map(combinedDataV, removeNumbers)

# lower characters
#combinedDataV <- tm_map(combinedDataV, content_transformer(tolower))

# save everything into a single .RData file
#save(combinedDataV, file = "combinedData.RData")

save(combinedData, file = "combinedData.RData")
