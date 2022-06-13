#!/bin/sh

#constantes
api_key=$(grep "^[0-9A-Za-z]\+$" ./api.key)
tmdb='https://api.themoviedb.org/3/'
get_image='https://image.tmdb.org/t/p/original'
pwd=$(pwd)
dependencies="jq"

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# para admitir los espacios
IFS='
' 
# https://api.themoviedb.org/3/movie/245891-john-wick?api_key=100502338a9609958a98bcaa27a821a4&language=es

# buscar una serie
# https://api.themoviedb.org/3/search/tv?api_key=100502338a9609958a98bcaa27a821a4&language=es&query=haven&page=1
  # imagen temporadas
  # https://api.themoviedb.org/3/tv/1416-grey-s-anatomy/season/1?api_key=100502338a9609958a98bcaa27a821a4&language=es

# buscar una pelicula
# https://api.themoviedb.org/3/search/movie?api_key=100502338a9609958a98bcaa27a821a4&language=es&query=alguno%20hombres%20buenos&page=1



# primero poner las funciones
check_dependencies(){
tput civis; counter=0
if [ ! "$(command -v $dependencies)" ]; then
		echo -e "${redColour}[X]${endColour}${grayColour} $dependencies${endColour}${yellowColour} no está instalado${endColour}"; sleep 1
			echo -e "\n${yellowColour}[i]${endColour}${grayColour} Instalando...${endColour}"; sleep 1
			apt install $dependencies -y > /dev/null 2>&1
			echo -e "\n${greenColour}[V]${endColour}${grayColour} $dependencies${endColour}${yellowColour} instalado${endColour}\n"; sleep 2
			let counter+=1
else 
  echo -e "${greenColour}[X]${endColour}${grayColour} $dependencies${endColour}${greenColour} está instalado${endColour}"; sleep 1
fi
}

isdirectory() {
  if [ -d "$1" ]
  then
    # 0 = true
    return 0 
  else
    # 1 = false
    return 1
  fi
}

get_id() {
if [ $# -lt 1 ]; then
  echo 'Hay que proporcionar el nombre del archivo'
else
	echo '1402-the-walking-dead'
fi
}

check_folder_serie() {
  if [ $# -lt 2 ]; then
  echo 'Hay que proporcionar la carpeta de la serie'
else
  #echo "hola -> $($2 | grep '^\[' | grep '\]$')"
  if isdirectory $1$2; then 
    if isnamefoldercorrect $2; then echo "correcto -> $2"; else echo "cambiarlo -> $2"; fi
  else echo "No es directorio"
  fi
fi
}

isnamefoldercorrect() {
if [ $# -lt 1 ]; then
  echo 'Hay que proporcionar Nombre de la carpeta de la serie'
  return 1
else
  if [ $(echo $1 | grep '^\[' | grep '\]$') ]; then return 0 ; else return 1; fi
fi
}

# iniciamos funcion inicial
init (){
  check_dependencies
  if [ $# -lt 1 ]; then
  for i in $(ls -C1)
  do
    echo $i
  done
else 
  for i in $(ls -C1 $1)
  do
    echo $1$i
    # archivo $1$i
    #get_id $i
    #check_folder_serie $1 $i
  done
fi
}

init $1
# Se pone 2> /dev/null -> para que no salga nada por pantalla
#temporada=$(curl https://api.themoviedb.org/3/tv/63174\?api_key\=100502338a9609958a98bcaa27a821a4\&language\=es\&page\=1 2> /dev/null | jq ".seasons[1].name" )
#echo "TEMPORADA->"$temporada
# 1. Entrar en la carpeta de las serie-> id
# 2. si hay archivos -> buscar temporada y capítulo
#    carpeta Temporada -> ({año}) Temporada {núm. temporada} -> si no existe crearla
#    mv los archivos a la carpeta temporada -> {temporada}x{capítulo} {título} 
# 3. Si no hay imagen del capítulo buscarlo -> mismo nombre que el archivo

# [47640-the-strain]
#   (2014) Temporada 1
#     1x01 Noche cero.mkv
#     1x01 Noche cero.jpg