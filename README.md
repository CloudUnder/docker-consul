# Docker Consul

More information will follow soon.

## Usage examples

```
docker run --rm cloudunder/consul version
```

```
docker run \
    -d \
    --name consul \
    -e SERVICE_NAME=consul \
    -v /node.json:/config/node.json:ro \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8500:8500 \
    cloudunder/consul agent -config-dir=/config
```
