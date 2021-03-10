# Development Stack

```bash
$ cd devstack
$ sudo ./add-systemd-service.sh
$ systemctl status devstack
```

edit hosts:

```bash
$ sudo vim /ect/hosts
```

add line:

```hosts
127.0.0.1 traefik.loc wiki.loc pgadmin.loc express.loc notebook.loc
```
