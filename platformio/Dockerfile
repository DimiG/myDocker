FROM python:2.7.16

ENV APP_VERSION="3.6.7" \
    APP="platformio"

ADD udev.rules /etc/udev/rules.d/99-platformio-udev.rules

RUN pip install -U ${APP}==${APP_VERSION} && \
    mkdir -p /workspace

WORKDIR /workspace

ENTRYPOINT ["platformio"]
