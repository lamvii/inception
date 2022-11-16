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
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install nginx -y \
    && apt-get install -y openssl

COPY nginx_config.sh /etc/nginx/sites-enabled/

RUN /bin/sh /etc/nginx/sites-enabled/nginx_config.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]