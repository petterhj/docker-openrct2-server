# docker-openrct2-server

Docker container for running a headless [openrct2](https://openrct2.org/) server. Inspired by [ich777/docker-openrct2-server](https://github.com/ich777/docker-openrct2-server/).

### Build

```sh
$ docker build --tag openrct2 . --progress plain
```

### Run

| Env. varaiable | Default |
| -------------- | --------|
| `GAME_VERSION` | `0.3.2` |
| `GAME_PORT` | `11753` |
| `UID` | `99` |
| `GID` | `100` |
| `USER` | `openrct2` |
| `BASE_DIR` | `/openrct2` |
| `SERVER_DIR` | `/openrct2/server` |
| `DATA_DIR` | `/openrct2/data` |
| `ORG_GAME_DIR` | `/openrct2/game` |

Expects a save file at the following location: `/openrct2/data/save/save.sv6`

```sh
$ docker run \
    -p 11753:11753 \
    -v /path/to/user/data:/openrct2/data \
    -v /path/to/original/rct1:/openrct2/game/rct1 \
    -v /path/to/original/rct2:/openrct2/game/rct2 \
    --name openrct2 openrct2
```