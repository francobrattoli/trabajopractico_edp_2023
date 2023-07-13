#!/bin/bash

# Verificar que se hayan proporcionado los argumentos requeridos
if [ $# -ne 2 ]; then
  echo "Error: Debes proporcionar dos archivos como argumentos."
  echo "Uso: ./descomprimir.sh <archivo_imagenes_comprimidas> <archivo_suma_verificacion>"
  exit 1
fi

# Obtener los nombres de los archivos de entrada
archivo_imagenes_comprimidas=$1
archivo_suma_verificacion=$2

# Verificar si el archivo de imágenes comprimidas existe
if [ ! -f "$archivo_imagenes_comprimidas" ]; then
  echo "Error: El archivo de imágenes comprimidas no existe."
  exit 1
fi

# Verificar si el archivo de suma de verificación existe
if [ ! -f "$archivo_suma_verificacion" ]; then
  echo "Error: El archivo de suma de verificación no existe."
  exit 1
fi

# Extraer el nombre del archivo ZIP
nombre_archivo_zip=$(basename "$archivo_imagenes_comprimidas")

# Crear un directorio para la descompresión
directorio_descompresion="descompresion"
mkdir -p "$directorio_descompresion"

# Descomprimir el archivo ZIP en el directorio de descompresión
unzip -q "$archivo_imagenes_comprimidas" -d "$directorio_descompresion"

# Verificar la suma de verificación del archivo descomprimido
md5sum -c "$archivo_suma_verificacion"

# Verificar si ocurrió algún error en la suma de verificación
if [ $? -eq 0 ]; then
  echo "La descompresión y verificación fueron exitosas."
else
  echo "Error: La suma de verificación no coincide. Puede haber ocurrido un problema durante la descompresión."
fi

echo "Proceso de descompresión completado."

