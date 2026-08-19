USE imdb_db;

-- media de nota e faturamento por decada
    decada,
    COUNT(id) AS total_filmes,
    ROUND(AVG(nota_imdb), 2) AS media_nota,
    ROUND(SUM(bilheteria_mundial) / 1000000000, 2) AS bilheteria_total_bi
FROM filmes
GROUP BY decada
ORDER BY decada ASC;

-- top 10 filmes
SELECT 
    titulo,
    ano_lancamento,
    ROUND(bilheteria_mundial / 1000000, 2) AS bilheteria_milhoes
FROM filmes
ORDER BY bilheteria_mundial DESC
LIMIT 10;

-- quantidade de filmes e média de avaliação por gênero
SELECT 
    g.nome_genero,
    COUNT(fg.filme_id) AS quantidade_filmes,
    ROUND(AVG(f.nota_imdb), 2) AS media_nota_imdb
FROM generos g
JOIN filme_genero fg ON g.id = fg.genero_id
JOIN filmes f ON fg.filme_id = f.id
GROUP BY g.nome_genero
ORDER BY quantidade_filmes DESC;

-- 4. maior e menor avaliação 
SELECT 
    MAX(nota_imdb) AS maior_avaliacao,
    MIN(nota_imdb) AS menor_avaliacao,
    ROUND(AVG(metascore), 2) AS media_metascore
FROM filmes;