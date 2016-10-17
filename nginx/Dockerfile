FROM nginx:1.10.1


ADD vapor.conf /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /vapor

CMD ["nginx"]

EXPOSE 80 443
