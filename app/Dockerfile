FROM maven:3.8.7-openjdk-18-slim

RUN apt-get update && apt-get upgrade -y && apt-get install \
    zlib1g zlib1g-dev -y \
    inetutils-ping -y \
    git -y \
    wget -y \
    build-essential -y \
    kmod -y \
    unzip -y \
    p7zip-full -y

COPY ./ /usr/src/
WORKDIR /usr/src

RUN set -ex \
    && mvn compile jetty:help

EXPOSE 8080
CMD ["mvn", "jetty:run"]
