FROM fedora:34

LABEL maintainer "NoEnv"
LABEL version "4.1.5"
LABEL description "Wazuh Agent"

COPY entrypoint.sh ossec.conf wazuh.repo /

RUN mv /wazuh.repo /etc/yum.repos.d/wazuh.repo && \
  rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH && \
  dnf -y install procps-ng inotify-tools python-docker wazuh-agent && \
  mv /ossec.conf /var/ossec/etc/ && \
  dnf clean all && \
  rm -rf /var/lib/dnf/repos/* /tmp/* /var/tmp/*

ENTRYPOINT ["/entrypoint.sh"]
