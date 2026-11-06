FROM nginx:alpine-slim

LABEL maintainer="VOLTRONET DevOps <contact@voltronet.ro>"
LABEL description="Enterprise Cloud Infrastructure & DevOps Landing Page"

# Curăță directorul default Nginx
RUN rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf

# Copiază fișierul index.html principal
COPY index.html /usr/share/nginx/html/

# Copiază întregul folder assets în directorul web Nginx
COPY assets/ /usr/share/nginx/html/assets/

# Copiază configurația Nginx personalizată (cu Gzip și caching)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
