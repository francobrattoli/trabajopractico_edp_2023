#!/bin/bash

# asigamos a una variable la carpeta con las imagenes procesadas
directorio_procesadas="imagenes_procesadas"

# Archivo con la lista de nombres de todas las imágenes
archivo_lista_todas="lista_todas.txt"

# Archivo con la lista de nombres válidos
archivo_lista_validas="lista_validas.txt"

# Archivo con el total de personas cuyo nombre finaliza con la letra 'a'
archivo_total_a="total_a.txt"

# Archivo comprimido que incluirá los archivos generados y las imágenes
archivo_comprimido="imagenes_comprimidas.zip"

# Generamos archivo con la lista de nombres de todas las imágenes
ls "$directorio_procesadas"/*.jpg > "$archivo_lista_todas"

# Generamos archivo con la lista de nombres válidos
grep -E '^[A-Z][a-z]+\.jpg$' "$archivo_lista_todas" > "$archivo_lista_validas"

# Generamos archivo con el total de personas cuyo nombre finaliza con la letra 'a'
grep -iE '[A-Z][a-z]+a\.jpg$' "$archivo_lista_validas" | wc -l > "$archivo_total_a"

# Comprimimos los archivos generados y las imágenes en un archivo comprimido
zip "$archivo_comprimido" "$archivo_lista_todas" "$archivo_lista_validas" "$archivo_total_a" "$directorio_procesadas"/*.jpg


