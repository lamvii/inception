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

FROM alpine:latest
RUN apk update && apk add nginx
RUN apk add vim && apk add openssl && apk add openrc
COPY nginx_config.sh /etc/nginx/http.d/
RUN chmod +x etc/nginx/http.d/nginx_config.sh

EXPOSE 443

ENTRYPOINT ./etc/nginx/http.d/nginx_config.sh