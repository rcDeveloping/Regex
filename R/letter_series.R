wds <- c("red", "yellow", "good", "Morning", "hello", "sweet", "kitten",
         "quero-quero", "lero lero", "zero zero zero", "just")


# get letter series
grep('(\\w+)\\1', wds, value = TRUE, perl = TRUE)

# Get repeated words
grep('(\\w+)[-\\s]\\1', wds, value = TRUE, perl = TRUE)
