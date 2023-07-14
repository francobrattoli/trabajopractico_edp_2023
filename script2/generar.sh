#!/bin/bash

# Crear el directorio de almacenamiento si no existe
mkdir -p almacenamiento

# Descargar el archivo de nombres de personas
wget -O dict.csv https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv

# Obtener el número de imágenes a generar del primer argumento
read -p "Ingrese la cantidad de imágenes a generar: " num_images


# Función para generar un nombre de archivo aleatorio de la lista de nombres
generate_random_filename() {
  local random_line=$(( RANDOM % 96222 + 1 ))
  local random_name=$(sed -n ${random_line}p dict.csv)
  echo "$random_name.jpg"
}

# Descargar las imágenes y asignar nombres de archivo al azar
for ((i=0; i<num_images; i++)); do
  random_filename=$(generate_random_filename)
  wget -O "almacenamiento/$random_filename" "https://source.unsplash.com/random/900x700/?person"
  sleep 1  # Esperar 1 segundo entre descargas para evitar problemas
done

# Comprimir las imágenes en un archivo ZIP
zip -r imagenes.zip almacenamiento

# Generar el archivo con la suma de verificación (checksum) del ZIP
md5sum imagenes.zip > checksum.txt
