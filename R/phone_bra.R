# Criar expressão regular em R para validar números de telefone no formato brasileiro.
# Os números de telefone no Brasil podem ter variações, mas para simplificar,
# vamos considerar o seguinte formato:
#     
# 1. O número deve começar com o código de área, que é composto por dois dígitos.
# 2. Após o código de área, pode haver um hífen opcional.
# 3. Após o hífen (se presente), deve haver um bloco de 4 a 5 dígitos.
# 4. Outro hífen é opcional e segue um bloco de 4 dígitos.
#
# Exemplos válidos:
#     
# 11-1234-5678
# 21-98765-4321
#
# Exemplos inválidos:
#     
# 123-4567 (faltando código de área)
# 11-12345-6789 (bloco de dígitos com mais de 5 caracteres)
# 41-9876-54321 (bloco de dígitos com mais de 5 caracteres)
#

library(dplyr, warn.conflicts = FALSE)

ifelse(grepl("\\d{2}\\-?\\d{4,5}\\-?\\d{4}$", vetor_numeros, perl = TRUE), "Válido", "Inválido")
