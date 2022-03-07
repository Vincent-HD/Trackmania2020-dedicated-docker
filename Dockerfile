FROM alpine

ENV TITLE=Trackmania GAME_SETTINGS=tracklist.xml DEDICATED_CFG=dedicated_cfg.xml

ARG SERVER_ZIP="http://files.v04.maniaplanet.com/server/TrackmaniaServer_Latest.zip"

WORKDIR /customconf

# Just to be able to conditionnaly copy optional files, Dockerfile is useless, COPY needs one file to be copied to not fail
COPY Dockerfile *dedicated_cfg.xml *tracklist.xml ./ 

WORKDIR /app

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh && \
    apk add --no-cache tree curl wget zip > /dev/null && \
    curl $SERVER_ZIP -s -o server.zip > /dev/null && \
    unzip -q server.zip > /dev/null && \
    rm server.zip && \
    mkdir /defaultconf && \
    cp UserData/Config/dedicated_cfg.default.txt /defaultconf && \
    cp UserData/Maps/MatchSettings/example.txt /defaultconf && \
    chmod +x TrackmaniaServer

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub > /dev/null && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk > /dev/null && \
    apk add glibc-2.33-r0.apk > /dev/null 

EXPOSE 2350 2350/udp 3450 3450/udp 5000

CMD [ "./entrypoint.sh" ]