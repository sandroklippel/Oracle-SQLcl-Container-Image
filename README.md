# Oracle SQLcl Container Image

- [Build Image](#build-image)
- [Run](#run)
- [Aliases](#create-alias)


## Build Image

```bash
podman build -t sqlcl  .
```
or 

```bash
docker build -f Containerfile -t sqlcl .
```

## Run

```bash
podman run -it --rm sqlcl
```
or

```bash
docker run -it --rm sqlcl
```


## Create alias

```bash
alias sqlcl='podman run -it --rm \
  -v `pwd`:/work \
  sqlcl'
```
or

```bash
alias sqlcl='docker run -it --rm \
  -v `pwd`:/work \
  sqlcl'
```

To persist add the `alias` command to `~/.bash_profile`.
