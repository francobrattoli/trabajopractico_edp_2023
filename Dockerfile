# Utiliza una imagen de Alpine como base
FROM alpine

# Copia los archivos necesarios al contenedor
COPY generar.sh /
COPY descomprimir.sh /
COPY procesar.sh /
COPY menu.sh /
COPY comprimir.sh /

# Establece los permisos de ejecución para los scripts
RUN chmod +x /*.sh

# Ejecuta el script menu.sh por defecto cuando se inicie el contenedor
CMD ["/menu.sh"]


