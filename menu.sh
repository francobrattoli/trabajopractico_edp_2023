#!/bin/bash


script_dir=$(dirname "$0")

while true; do
  echo "Elija la opción deseada:"
  echo "1. Generar imágenes"
  echo "2. Descomprimir"
  echo "3. Procesar imágenes"
  echo "4. Comprimir archivos"
  echo "5. Salir"

  read -p "Opción: " opcion

  case $opcion in
    1)
      ./generar.sh
      ;;
    2)
      ./descomprimir.sh
      ;;
    3)
      ./procesar.sh
      ;;
    4)
      ./comprimir.sh
      ;;
    5)
      echo "Saliendo del menú..."
      break
      ;;
    *)
      echo "Opción inválida. Por favor, seleccione una opción válida."
      ;;
  esac
done
