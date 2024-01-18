data <- c("Ipomoea carajasensis D.F. Austin.", 'Manilkara huberi (Ducke) Chevalier',
          'Aspidosperma album (Vahl)Benth. ex Pichon', 'Pilocarpus alatus C.J.Joseph ex Skorupa')

# Concatenate genus, epithet and taxonomic authority to produce a text
gsub('(\\w+\\s)(\\w+\\s)(.*)', '\\1 \\2 was described by \\3', data)

# get the genus from scientific names
gsub('(\\w+)\\s\\w+.*', '\\1', data)

# get the epithet from scientific names
gsub('\\w+\\s(\\w+)\\s.*', '\\1', data)

# get the taxonomic authority from scientific names
gsub('\\w+\\s\\w+\\s(.*)', '\\1', data)
