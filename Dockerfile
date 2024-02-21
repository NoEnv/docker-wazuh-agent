FROM debian:buster-slim

LABEL maintainer "NoEnv"
LABEL version "4.3.4"
LABEL description "Wazuh Agent"

COPY entrypoint.sh ossec.conf /

RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools python-docker && \
  curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
  echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list && \
  apt-get update && \
  apt-get install -y wazuh-agent=4.4.4-1 && \
  mv /ossec.conf /var/ossec/etc/ && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
