# serve-docker

```bash
docker build --pull -t serve-docker https://github.com/loeffel-io/serve-docker.git#master
docker run -d --name=serve-docker --restart=always -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 serve-docker:latest
```
