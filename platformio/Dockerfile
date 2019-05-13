FROM python:2.7.16

# Dockerfile for MCU compilation by PlatformIO
# Created by: Dmitri G.
# Date: 2019-05-13

# ***   NOT USED in current configuration!!! Just skip  ***
# *** Install Netcat and Sudo utility for Remote Container Access ***
# RUN apt-get update && apt-get install -y \
#       netcat \
#       sudo \
#       && rm -rf /var/lib/apt/lists/* && \
#       echo 'dockeruser:password' | chpasswd && \
#       echo 'dockeruser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# *** Port Connection TO ***
# EXPOSE 2323
# ***   NOT USED in current configuration!!!   ***

# *** Create Variables for container ***
ARG MYBINPATH="/usr/local/bin"
ARG MYPYPATH="/home/dockeruser/penv/bin"
ARG MYWORKDIR="/home/dockeruser/workspace"

ENV APP_VERSION="3.6.7" \
    APP="platformio" \
    PATH="${MYPYPATH}:${PATH}"

# *** Create USER for container ***
RUN groupadd -g 999 dockeruser && \
      useradd -r -m -u 999 -g dockeruser dockeruser

# *** Add necessary files to container ***
ADD udev.rules /etc/udev/rules.d/99-platformio-udev.rules

# *** Add Entrypoint Script ***
ADD entrypoint.sh ${MYBINPATH}/entrypoint.sh
RUN chown root:staff ${MYBINPATH}/entrypoint.sh && \
     chmod 755 ${MYBINPATH}/entrypoint.sh

# *** Change current USER ***
USER dockeruser

# *** Install PlatformIO ***
RUN cd && virtualenv penv && \
      . ${MYPYPATH}/activate && \
      pip install -U ${APP}==${APP_VERSION} && \
      mkdir -p .platformio workspace && \
      echo "alias la='ls -la'" > .bash_aliases && \
      echo "alias ..='cd ..'" >> .bash_aliases && \
      echo "alias pr='pio run'" >> .bash_aliases && \
      echo "alias pc='pio run --target clean'" >> .bash_aliases

# *** Setup working directory ***
WORKDIR ${MYWORKDIR}

ENTRYPOINT ["entrypoint.sh"]

