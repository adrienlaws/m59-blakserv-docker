FROM alpine:3.14

ENV PATH="${PATH}:/opt/Meridian59/run/server"

EXPOSE 5959 9998

RUN mkdir -p /m59files
COPY kodbase.txt /m59files/kodbase.txt
COPY accounts.1692158715 /m59files/accounts.1692158715
ADD rsc /m59files
ADD memmap /m59files

RUN apk update && \
    apk add build-base git shadow busybox-extras &&\
    git clone https://github.com/Meridian59/Meridian59.git /opt/Meridian59 && \
    make --directory=/opt/Meridian59/blakserv -f makefile.linux && \
    useradd m59-user && \
    groupadd meridian59 && \
    usermod -a -G meridian59 m59-user && \
    # contains account3 test/test user
    mv /m59files/accounts.1692158715 /opt/Meridian59/run/server/savegame/accounts.1692158715 && \
    mv /m59files/*.rsc /opt/Meridian59/run/server/rsc && \
    mv /m59files/*.bof /opt/Meridian59/run/server/memmap && \
    mv /m59files/kodbase.txt /opt/Meridian59/run/server && \
    # change ownership and permissions on /opt/Meridian59 directories
    chown -R m59-user:meridian59 /opt/Meridian59 && \
    chmod 2775 /opt/Meridian59 && \
    # change windows blackslashes to linux slashes
    sed -i "s^\\\^/^g" /opt/Meridian59/run/server/blakserv.cfg && \
    # add in blackserv.cfg Kodbase reference (replace ../../kod with ./)
    sed -i "s^..\/..\/kod^.\/^" /opt/Meridian59/run/server/blakserv.cfg && \
    # testing settings below
    # do not leave the maintenance mask open if running in production this is strictly for testing and local management
    sed -i '/\[Socket\]/a MaintenancePort      9998\nMaintenanceMask      0.0.0.0' /opt/Meridian59/run/server/blakserv.cfg && \
    # enable realtime logging (bad for production but good for troubleshooting)
    sed -i '/\[Channel\]/a Flush                Yes' /opt/Meridian59/run/server/blakserv.cfg

USER m59-user

# ENTRYPOINT ["/bin/sh"]
CMD /opt/Meridian59/run/server/blakserv