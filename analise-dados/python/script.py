import pandas as pd
import ast

df = pd.read_csv("ToP 250 movies on imdb in 2026.csv")

df["releaseDate"] = pd.to_datetime(df["releaseDate"])

df = df.drop(columns=[
    "url",
    "originalTitle",
    "description",
    "primaryImage",
    "thumbnails",
    "trailer",
    "contentRating",
    "releaseDate",
    "interests",
    "externalLinks",
    "spokenLanguages",
    "filmingLocations",
    "productionCompanies",
    "isAdult",
    "runtimeMinutes",
    "countriesOfOrigin",
    "endYear",
    "budget"
])

df["genres"] = df["genres"].apply(ast.literal_eval)

df = df.explode("genres")

df_filmes = df.drop_duplicates("id")

df_filmes["decada"] = (df_filmes["startYear"] // 10) * 10

df_generos = df[["id", "genres"]].copy()

df_generos = df_generos.rename(columns={
    "id": "id_filme",
    "genres": "genero"
})

df_filmes = df_filmes.drop(columns=["genres"])

df_filmes.to_csv(
    "filmes.csv",
    index=False,
    na_rep="NULL"
)

df_generos.to_csv(
    "filmes_generos.csv",
    index=False,
    na_rep="NULL"
)