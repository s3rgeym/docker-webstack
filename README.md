# Development Stack

```bash
$ cd compose-webstack
$ sudo ./add-systemd-service.sh
$ systemctl status compose-webstack
```

edit hosts:

```bash
$ sudo vim /ect/hosts
```

add line:

```hosts
127.0.0.1 traefik.loc wiki.loc pgadmin.loc adminer.loc express.loc notebook.loc
```
