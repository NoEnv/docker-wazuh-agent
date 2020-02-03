## docker-wazuh-agent

#### Description

Wazuh Agent as Docker Image.

#### Run

most simple way of running the container

    docker run --rm noenv/wazuh-agent

advanced usage

    docker run -d --name wazuh -v /:/rootfs -v /var/ossec:/var/ossec noenv/wazuh-agent -c /var/ossec/etc/ossec.conf
