#!/bin/sh

PRIVATE_IP=$(wget -q -O - http://169.254.169.254/2014-11-05/meta-data/local-ipv4)

if [ -z ${PRIVATE_IP} ]; then
	exit 1
fi

INSTANCE_ID=$(wget -q -O - http://169.254.169.254/2014-11-05/meta-data/instance-id)
AVAILABILITY_ZONE=$(wget -q -O - http://169.254.169.254/2014-11-05/meta-data/placement/availability-zone)

# Write config file
cat >/config/instance.json <<EOL
{
    "datacenter": "${AVAILABILITY_ZONE}",
    "node_name": "${INSTANCE_ID}",
    "advertise_addr": "${PRIVATE_IP}"
}
EOL

# Run Consul
/bin/consul $@
exit $?
