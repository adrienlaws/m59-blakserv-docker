FROM alpine:3.14

ENV PATH="${PATH}:/opt/Meridian59/run/server"

EXPOSE 5959 9998

RUN apk update && \
    # add needed packages including busybox to telnet to maintenance port
    apk add build-base git shadow busybox-extras &&\
    git clone https://github.com/Meridian59/Meridian59.git /opt/Meridian59 && \
    make --directory=/opt/Meridian59/blakserv -f makefile.linux && \
    useradd m59-user && \
    groupadd meridian59 && \
    usermod -a -G meridian59 m59-user && \
    chown -R m59-user:meridian59 /opt/Meridian59 && \
    chmod 2775 /opt/Meridian59 && \
    sed -i "s^\\\^/^g" /opt/Meridian59/run/server/blakserv.cfg && \
    sed -i '/\[Socket\]/a MaintenancePort         9998\nMaintenanceMask         0.0.0.0' /opt/Meridian59/run/server/blakserv.cfg
# add in flush yes to blakserv.cfg
# copy over local windows files with accounts premade
# kodbase.txt and all the bof and rsc files - copy them all over from your local windows setup

ENTRYPOINT ["/bin/sh"]