###########################
# File Name  : Dockerfile #
# Created by : Dmitri G.  #
# Date       : 2019-06-20 #
###########################
FROM nginx:latest

# *** Copy necessary files ***
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/mysite.template
COPY html /usr/share/nginx/html

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/mysite.template > \
  /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"

