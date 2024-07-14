## Clear all environment

```sh
#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -qa)
docker volume rm -f $(docker volume ls -q)
```

## Clear all enrivonment (found this one that seems easier than the previous one)

```sh
#!/bin/bash

docker system prune --all --volumes --force
```
