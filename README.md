# mysql-4.0.30
Imagem de docker com o Mysql 4.0.30

## Variaveis 

*MYSQL_ROOT_PASSWORD*

Define a senha padrão para root de qualquer host (root@%). Esse parametro é obrigatório para que a senha nao fique em branco.

*MYSQL_DATABASE*
Especifica database a ser criado durante a inicialização do container

## Exemplos de comandos
```
$ docker run -d --name mysql40 -v /meudatabase:/var/db/mysql -p 3306:3306 darkbebs/mysql40
```

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
$ docker exec -it [container_id] sh
```