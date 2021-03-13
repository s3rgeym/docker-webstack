# Docker Compose Web Stack

create systemd service:

```bash
$ cd docker-webstack
$ sudo ./create-service.sh
$ systemctl status docker-webstack
```

create database for wiki.js:

```bash
$ docker-compose exec postgres psql -U postgres -c 'create database wikijs'
```

edit hosts:

```bash
$ sudo vim /ect/hosts
```

add line:

```hosts
127.0.0.1 pgadmin.local traefik.local wikijs.local
```

sources:

```
postgres://postgres:secret@localhost:54321/db
redis://localhost:63791/1
```
