FROM: nginx:1.10.1


ADD vapor.conf /etc/nginx/sites-available/

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
