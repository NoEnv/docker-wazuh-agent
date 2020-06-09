## docker-wazuh-agent

#### Description

Wazuh Agent as Docker Image.

#### Run

most simple way of running the container

    docker run --rm noenv/wazuh-agent

advanced usage

    docker run -d --name wazuh -v /:/rootfs:ro --net host --hostname ${HOSTNAME} \
      -e JOIN_MANAGER=172.17.0.1 -e JOIN_GROUPS=default,test -e JOIN_PASSWORD=test123 \
      -v /etc/os-release:/etc/os-release \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v /var/ossec/ossec.conf:/var/ossec/etc/ossec.conf \
      -v /var/ossec/local_internal_options.conf:/var/ossec/etc/local_internal_options.conf \
      -v /var/ossec/client.keys:/var/ossec/etc/client.keys noenv/wazuh-agent

#### Source

https://github.com/noenv/docker-wazuh-agent
