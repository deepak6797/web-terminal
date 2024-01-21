FROM python:slim-bullseye

COPY ./ttyd.x86_64 /ttyd.x86_64

RUN apt-get update -y && \
    apt-get install -y g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev && \
    apt-get install -y procps net-tools curl wget build-essential libffi-dev libaio1 libaio-dev default-libmysqlclient-dev software-properties-common && \
    apt-get autoremove -y

EXPOSE 8080

ENTRYPOINT [ "/ttyd.x86_64","-c", "admin:admin", "-p", "8080", "bash" ]