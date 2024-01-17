library(dplyr, warn.conflicts = FALSE)


# email data
email <- data.frame(
    email = c('wolver@uol.com', 'headcat@gmail.com', 'aflorest@yahoo.com.br',
              'regex@aol.com', 'zexcia@yandex.com', 'pokemon@outlook.com',
              'joezen@icloud.com', 'rlang@hotmail.com', 'control@bra.gov.br')
)

# get user name and host name
df <- email %>%
    mutate(user = gsub('@\\w.+', '', email)) %>%
    mutate(host = gsub('\\w+@|\\.\\w+', '', email))
