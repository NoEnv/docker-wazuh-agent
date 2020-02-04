## docker-wazuh-agent

#### Description

Wazuh Agent as Docker Image.

#### Run

most simple way of running the container

    docker run --rm noenv/wazuh-agent

advanced usage

    docker run -d --name wazuh -v /:/rootfs:ro --net host \
      -v /etc/os-release:/etc/os-release \
      -v /var/ossec/etc/ossec.conf:/var/ossec/etc/ossec.conf \
      -v /var/ossec/etc/shared:/var/ossec/etc/shared \
      -v /var/ossec/etc/client.keys:/var/ossec/etc/client.keys noenv/wazuh-agent

#### Source

https://github.com/noenv/docker-wazuh-agent
