-- criação bd
CREATE DATABASE IF NOT EXISTS imdb_db;
USE imdb_db;

-- tabela de filmes
CREATE TABLE IF NOT EXISTS filmes (
    id VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_lancamento INT,
    duracao_minutos INT,
    orcamento BIGINT,
    bilheteria_mundial BIGINT,
    lucro BIGINT,
    decada INT,
    nota_imdb DECIMAL(3,1),
    num_votos INT,
    metascore INT
);

-- tabela de generos
CREATE TABLE IF NOT EXISTS generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero VARCHAR(50) NOT NULL UNIQUE
);

-- relacionamento
CREATE TABLE IF NOT EXISTS filme_genero (
    filme_id VARCHAR(20),
    genero_id INT,
    PRIMARY KEY (filme_id, genero_id),
    FOREIGN KEY (filme_id) REFERENCES filmes(id) ON DELETE CASCADE,
    FOREIGN KEY (genero_id) REFERENCES generos(id) ON DELETE CASCADE
);