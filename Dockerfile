FROM fedora:32
RUN dnf -y install samba
COPY tmp/users.tmp /tmp
COPY tmp/users.sh /tmp/users.sh
RUN cd /tmp && ./users.sh
RUN rm /tmp/users.tmp
CMD /bin/bash -c "smbd --foreground --log-stdout --no-process-group"
