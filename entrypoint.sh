#!/bin/bash

# Register agent if client.keys is empty
if [ ! -s /var/ossec/etc/client.keys ]; then
  groups=${JOIN_GROUPS:-default}
  password=""
  if [[ ! -z "${JOIN_PASSWORD}" ]]; then
    password="-P ${JOIN_PASSWORD}"
  fi
  manager=${JOIN_MANAGER:-172.17.0.1}
  /var/ossec/bin/agent-auth -m $manager -G $groups $password
fi

# Start the agent
/var/ossec/bin/ossec-control start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start agent: $status"
  exit $status
fi

echo "background jobs running, listening for changes"

while sleep 60; do
  /var/ossec/bin/ossec-control status > /dev/null 2>&1
  status=$?
  if [ $status -ne 0 ]; then
    echo "looks like the agent died."
    exit 1
  fi
done
