library(dplyr, warn.conflicts = FALSE)


# vetor com cpf e cnpj
dados <- c('061.710.112-98', '01.123.456/0001-11', '123.019.452-77', '1558785698')

# Extrair apenas cpf
grep('\\d{3}.\\d{3}.\\d{3}-\\d', value = TRUE, perl = TRUE, dados)

# remover caracteres especiais
dados_clean <- gsub('[.-/-]', '', dados)


# Classificar empresa e pessoa fisica
cpf_cnpj <- data.frame(cpf_cnpj = dados_clean) %>%
        mutate(
                tipo_pessoa = case_when(
                        nchar(cpf_cnpj) == 11 ~ "pessoa física",
                        nchar(cpf_cnpj) == 14 ~ "pessoa jurídica",
                        .default = NA
                )
        )


# Inserir caracteres "." e "-" no cpf
df <- cpf_cnpj %>%
        mutate(
                cod_cpf_cnpj = case_when(
                        nchar(cpf_cnpj) == 11 ~ paste0(
                                substr(cpf, 1, 3), ".",
                                substr(cpf, 4, 6), ".",
                                substr(cpf, 7, 9), "-",
                                substr(cpf, 10, 11)
                        ),
                        nchar(cpf_cnpj) == 14 ~ paste0(
                                substr(cpf, 1, 2), ".",
                                substr(cpf, 3, 5), ".",
                                substr(cpf, 6, 8), "/",
                                substr(cpf, 9, 12), "-",
                                substr(cpf, 13, 14)
                        ),
                        .default = NA
                )
        )

# Ocultar os 3 primeiros digitos e os 2 ultimos digitos do CPF
df2 <- df %>%
        mutate(
                cpf_cnpj_clean = case_when(
                        tipo_pessoa == "pessoa física" ~ gsub("^.{3}", "***", cod_cpf_cnpj),
                        .default = cod_cpf_cnpj
                )
        ) %>%
        mutate(
                cpf_cnpj_clean = case_when(
                        tipo_pessoa == "pessoa física" ~ gsub(".{2}$", "**", cpf_cnpj_clean),
                        .default = cod_cpf_cnpj)
        )
