FROM python:3.9.5-slim

# Dockerfile for Jupyter Notebook development
# Created by: Dmitri G.
# Date: 2021-06-28
# File Name: Dockerfile

# *** Set Environment Variables for container ***
ARG MYBINPATH="/usr/local/bin"
ARG MYUSRPATH="/home/dockeruser"
ARG MYWORKDIR="/home/dockeruser/wrkspace"
ARG dockeruser_gid=998

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="${MYUSRPATH}/.venv/bin:${PATH}"

# *** Install tini ***
RUN apt-get update && apt-get install -y \
      tini \
      && rm -rf /var/lib/apt/lists/*

# *** Add Entrypoint Script ***
ADD entrypoint.sh ${MYBINPATH}/entrypoint.sh

# *** Create USER for container ***
RUN chown root:staff ${MYBINPATH}/entrypoint.sh && \
      chmod 755 ${MYBINPATH}/entrypoint.sh && \
      groupadd -g $dockeruser_gid dockeruser && \
      useradd -r -m -u 999 -g dockeruser -G staff dockeruser

COPY requirements.txt ${MYUSRPATH}

RUN chown dockeruser:dockeruser ${MYUSRPATH}/requirements.txt && \
      chmod 644 ${MYUSRPATH}/requirements.txt

# *** Change current USER ***
USER dockeruser

# *** Install Jupyter ***
RUN cd && python -m venv .venv && \
      . /home/dockeruser/.venv/bin/activate && \
      python -m pip install --upgrade pip && \
      pip install -U --no-cache-dir -r requirements.txt && \
      deactivate && \
      mkdir -p wrkspace && \
      echo "alias la='ls -la'" > .bash_aliases && \
      echo "alias ..='cd ..'" >> .bash_aliases && \
      echo "# Python3 related" >> .bash_aliases && \
      echo "alias a='source ~/.venv/bin/activate'" >> .bash_aliases && \
      echo "alias d='deactivate'" >> .bash_aliases

# *** Setup working directory ***
WORKDIR ${MYWORKDIR}

ENTRYPOINT ["entrypoint.sh"]

