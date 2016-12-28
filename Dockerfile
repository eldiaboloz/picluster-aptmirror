FROM armhf/debian:jessie

RUN apt-get update \
	&& apt-get -y install apt-mirror nginx \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /storage

COPY mirror.list /etc/apt/mirror.list
COPY nginx.vhost.conf /etc/nginx/sites-available/default

EXPOSE 9999

CMD ["nginx", "-g", "daemon off;"]
