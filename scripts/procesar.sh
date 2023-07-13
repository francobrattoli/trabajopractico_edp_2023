#!/bin/bash

# Carpeta de entrada con las imágenes descomprimidas
carpeta_entrada="almacenamiento"

# Carpeta de salida para las imágenes procesadas
carpeta_salida="imagenes_procesadas"

# Verificar si la carpeta de salida existe, si no, crearla
if [ ! -d "$carpeta_salida" ]; then
  mkdir "$carpeta_salida"
fi

# Obtener la lista de imágenes válidas para procesar (nombres de archivo que cumplen con el patrón)
lista_imagenes_validas=$(find "$carpeta_entrada" -type f -name '[A-Z]*.jpg')

# Recortar las imágenes a una resolución de 512x512 utilizando ImageMagick
for imagen in $lista_imagenes_validas; do
  nombre_archivo=$(basename "$imagen")
  convert "$imagen" -resize 512x512 "$carpeta_salida/$nombre_archivo"
  echo "Imagen procesada: $nombre_archivo"
done

echo "Proceso de procesamiento de imágenes completado."

