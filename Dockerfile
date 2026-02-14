FROM nginx:alpine

# Copiar archivos del proyecto
COPY index.html /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY Love_files/ /usr/share/nginx/html/Love_files/
COPY LEEME.md /usr/share/nginx/html/
COPY LEEME.txt /usr/share/nginx/html/

# Copiar configuración de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer puerto
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
