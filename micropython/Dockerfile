FROM python:3.7.3

# Dockerfile for MCU MicroPython work
# Created by: Dmitri G.
# Date: 2019-07-17

# *** Create Variables for container ***
ARG MYBINPATH="/usr/local/bin"
ARG MYPYPATH="/home/dockeruser/penv/bin"
ARG MYWORKDIR="/home/dockeruser/workspace"

ENV APP1_VERSION="0.0.24" \
    APP1="rshell" \
    APP2="adafruit-ampy" \
    PATH="${MYPYPATH}:${PATH}"

# *** Install picocom and lsusb utility ***
RUN apt-get update && apt-get install -y \
      picocom \
      usbutils \
      && rm -rf /var/lib/apt/lists/*

# *** Add Entrypoint Script ***
ADD entrypoint.sh ${MYBINPATH}/entrypoint.sh

# *** Create USER for container and install virtualenv ***
RUN chown root:staff ${MYBINPATH}/entrypoint.sh && \
      chmod 755 ${MYBINPATH}/entrypoint.sh && \
      groupadd -g 999 dockeruser && \
      useradd -r -m -u 999 -g dockeruser -G staff dockeruser && \
      pip install -U virtualenv

# *** Change current USER ***
USER dockeruser

# *** Install Rshell ***
RUN cd && virtualenv penv && \
      . ${MYPYPATH}/activate && \
      pip install -U ${APP1}==${APP1_VERSION} && \
      pip install -U ${APP2} && \
      mkdir -p workspace && \
      echo "alias la='ls -la'" > .bash_aliases && \
      echo "alias ..='cd ..'" >> .bash_aliases && \
      echo "alias r='rshell -p /dev/ttyUSB0'" >> .bash_aliases && \
      echo "alias p='picocom -b 115200 /dev/ttyUSB0'" >> .bash_aliases && \
      echo "alias als='ampy -p /dev/ttyUSB0 ls'" >> .bash_aliases

# *** Setup working directory ***
WORKDIR ${MYWORKDIR}

ENTRYPOINT ["entrypoint.sh"]

