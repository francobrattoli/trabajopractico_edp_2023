#!/bin/bash

# Carpeta de entrada con las imágenes
directorio_entrada="/home/jack/tp_edp_2023/trabajopractico_edp_2023/scripts/almacenamiento"

# Carpeta de salida para las imágenes procesadas
directorio_salida="imagenes_procesadas"

# Verificar si la carpeta de salida existe, si no, crearla
if [ ! -d "$directorio_salida" ]; then
  mkdir "$directorio_salida"
fi

# Recortar las imágenes a una resolución de 512x512 utilizando ImageMagick
for imagen in "$directorio_entrada"/*.jpg; do
  nombre_archivo=$(basename "$imagen")

  # Verificar si el nombre de archivo cumple con el patrón de nombres de personas válidos
  #if [[ $nombre_archivo =~ ^[A-Z][a-z]+\.jpg$ ]]; then
    convert "$imagen" -resize 512x512^ -gravity center -extent 512x512 "$directorio_salida/$nombre_archivo"
    echo "Imagen procesada: $nombre_archivo"
  #else
   # echo "Nombre de archivo no válido: $nombre_archivo"
  #fi
done

echo "Proceso de procesamiento de imágenes completado."


#convert entrada.jpg -gravity center -resize 512x512+0+0 \-extent 512x512
