FROM nginx

COPY nginx.conf /etc/nginx/
COPY dhparam.pem /etc/ssl/private/
COPY server.crt /etc/ssl/private
COPY server.key /etc/ssl/private
CMD nginx -g "daemon off;"
