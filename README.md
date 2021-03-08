# Development Stack

```zsh
$ cd devstack
$ cat systemd-service.tpl | envsubst | sudo tee /etc/systemd/system/devstack.service &> /dev/null
$ sudo systemctl enable --now devstack
```
