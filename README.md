# mysql-4.0.30
Docker container image for old MySQL version 4.0.30

## Build

```
$ cd mysql-4.0.30
$ docker build -t [image-name] .
```

## Run

```
$ docker run -d -p 3306:3306 --name [container_name] [image_name]
```

## Login Container

```
$ docker ps -a
$ docker exec -it [container_id] /bin/bash
```
# mysql-4.0.30
# mysql-4.0.30
