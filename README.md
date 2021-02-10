# A Cloud9 docker image based on Alpine Linux

## Base Docker Image
[Alpine](https://hub.docker.com/_/alpine) (x64)

## Get the image from Docker Hub or build it locally
```
docker pull fullaxx/cloud9-alpine
docker build -t="fullaxx/cloud9-alpine" github.com/Fullaxx/cloud9-alpine
```

## Run the image on port 80
```
docker run -d -p 80:80 fullaxx/cloud9-alpine
```

## Save your Cloud9 workspace on the host
```
docker run -d -p 80:80 -v /your/path/c9ws/:/c9ws/ fullaxx/cloud9-alpine
```
