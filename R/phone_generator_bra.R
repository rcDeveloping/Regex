# Função para gerar números de telefone válidos
gerar_numero_valido <- function() {
    codigo_area <- sample(10:99, 1)  # Código de área de dois dígitos
    bloco_digitos <- sample(1000:9999, 1)  # Bloco de 4 dígitos
    hifen1 <- ifelse(sample(c(TRUE, FALSE), 1), "-", "")  # Hífen opcional
    bloco_digitos2 <- sample(1000:9999, 1)  # Segundo bloco de 4 dígitos
    hifen2 <- ifelse(sample(c(TRUE, FALSE), 1), "-", "")  # Segundo hífen opcional
    
    numero_valido <- paste0(codigo_area, hifen1, bloco_digitos, hifen2, bloco_digitos2)
    return(numero_valido)
}

# Função para gerar números de telefone inválidos
gerar_numero_invalido <- function() {
    codigo_area <- sample(10:99, 1)  # Código de área de dois dígitos
    bloco_digitos <- sample(1000:99999, 1)  # Bloco de mais de 5 dígitos
    hifen1 <- ifelse(sample(c(TRUE, FALSE), 1), "-", "")  # Hífen opcional
    bloco_digitos2 <- sample(1000:99999, 1)  # Segundo bloco de mais de 5 dígitos
    hifen2 <- ifelse(sample(c(TRUE, FALSE), 1), "-", "")  # Segundo hífen opcional
    
    numero_invalido <- paste0(codigo_area, hifen1, bloco_digitos, hifen2, bloco_digitos2)
    return(numero_invalido)
}

# Gerar vetor com 25 números válidos e 25 números inválidos
vetor_numeros <- c(replicate(25, gerar_numero_valido()),
                   replicate(25, gerar_numero_invalido()))

# Embaralhar o vetor para que os números estejam em ordem aleatória
vetor_numeros <- sample(vetor_numeros)

# Exibir o vetor gerado
print(vetor_numeros)
