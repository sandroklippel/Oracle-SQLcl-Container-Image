# Oracle SQLcl Container Image

- [Build Image](#build-image)
- [Run](#run)
- [Aliases](#create-alias)


## Build Image

```bash
podman build -t sqlcl  .
```

## Run

```bash
podman run -it --rm sqlcl
```


## Create alias

```bash
alias sqlcl='podman run -it --rm \
  --network="host" \
  -v `pwd`:/work \
  sqlcl:latest'
```

To persist add the `alias` command to `~/.bash_profile`.
