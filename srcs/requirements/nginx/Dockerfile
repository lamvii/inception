# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-idri <ael-idri@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/11 13:16:29 by ael-idri          #+#    #+#              #
#    Updated: 2022/11/11 13:17:44 by ael-idri         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ARG _CERTIF=$_CERTIF
ARG _CERTIF_key=$_CERTIF_key
ARG _CERTIF_crt=$_CERTIF_crt

RUN apt update; apt install  openssl vim nginx -y;

COPY nginx_config.sh /tmp/

RUN /bin/bash /tmp/nginx_config.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]