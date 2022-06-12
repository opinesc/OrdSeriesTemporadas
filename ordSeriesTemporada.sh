#!/bin/sh

#constantes
api_key=$(grep "^[0-9A-Za-z]\+$" ./api.key)
tmdb='https://api.themoviedb.org/3/'
get_image='https://image.tmdb.org/t/p/original'
pwd=$(pwd)

# https://api.themoviedb.org/3/movie/245891-john-wick?api_key=100502338a9609958a98bcaa27a821a4&language=es

# buscar una serie
# https://api.themoviedb.org/3/search/tv?api_key=100502338a9609958a98bcaa27a821a4&language=es&query=haven&page=1
  # imagen temporadas
  # https://api.themoviedb.org/3/tv/1416-grey-s-anatomy/season/1?api_key=100502338a9609958a98bcaa27a821a4&language=es

# buscar una pelicula
# https://api.themoviedb.org/3/search/movie?api_key=100502338a9609958a98bcaa27a821a4&language=es&query=alguno%20hombres%20buenos&page=1

# primero poner las funciones





# 1. Entrar en la carpeta de las serie-> id
# 2. si hay archivos -> buscar temporada y capítulo
#    carpeta Temporada -> ({año}) Temporada {núm. temporada} -> si no existe crearla
#    mv los archivos a la carpeta temporada -> {temporada}x{capítulo} {título} 
# 3. Si no hay imagen del capítulo buscarlo -> mismo nombre que el archivo

# [47640-the-strain]
#   (2014) Temporada 1
#     1x01 Noche cero.mkv
#     1x01 Noche cero.jpg