#!/bin/bash

# Creamos un directorio para almacenar las imagenes generadas 
mkdir -p almacenamiento

# Descargamos el csv con la lista aleatoria de nombres de personas
wget -O dict.csv https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv

# Obtenenemos la cantidad de imágenes a generar mediante el primer argumento
num_images=$1

# Mediante esta función generamos nombres aleatorios obtenidos de la lista del csv, para posteriormente asignarselo como nombre
# de archivo a la imagen generada
generate_random_filename() {
  local random_line=$(( RANDOM % 96222 + 1 ))
  local random_name=$(sed -n ${random_line}p dict.csv)
  echo "$random_name.jpg"
}

# Descargamos las imágenes y asignamos nombres de archivo al azar
for ((i=0; i<num_images; i++)); do
  random_filename=$(generate_random_filename)
  wget -O "almacenamiento/$random_filename" "https://source.unsplash.com/random/900x700/?person"
  sleep 2  # Esperamos 2 segundos entre descargas para evitar problemas
done

# Comprimimos las imágnenes mediante zip. (Evaluar utilizar tar)
zip -r imagenes.zip almacenamiento

# Generamos el archivo con la suma de verificación (checksum) del ZIP
md5sum imagenes.zip > checksum.txt
