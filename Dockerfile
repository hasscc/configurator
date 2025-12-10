FROM alpine

ENV PIP_BREAK_SYSTEM_PACKAGES=1

ARG CONFIGURATOR_VERSION=0.5.2

RUN \
    apk add --no-cache \
        git bash curl \
        openssh-client \
        py3-pip \
        python3 \
    && pip3 install \
        hass-configurator=="${CONFIGURATOR_VERSION}" \
    \
    && find /usr/local \
        \( -type d -a -name test -o -name tests -o -name '__pycache__' \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' +

COPY rootfs /

CMD [ "hass-configurator", "/etc/configurator.conf" ]
HEALTHCHECK --interval=1m --start-period=10s CMD curl --fail http://127.0.0.1:8099 || exit 1