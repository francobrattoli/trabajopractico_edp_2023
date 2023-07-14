# Imagen base
FROM alpine

# Actualizar paquetes e instalar dependencias
RUN apk update && apk add bash imagemagick

# Copiar los scripts al contenedor


# Establecer el directorio de trabajo
WORKDIR /app

ADD script2 script2
# Establecer permisos de ejecución en los scripts
RUN chmod +x *.sh

# Ejecutar el menú por defecto al iniciar el contenedor
CMD ["bash", "/app/script2/menu.sh"]

