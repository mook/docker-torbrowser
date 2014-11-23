# Tor Browser in Docker #

This is a docker image with Tor Browser inside to reduce the amount of data
persisted between usage sessions.  The default download directory should be
mounted as a volume for cases where data sharing is desired.

This container does *not* set up a ssh server; instead, X11 is shared by
exposing the relevant sockets.  This means there is no need to stop the
container manually - it goes away when you quit the browser.

# Building #

```shell
git clone https://github.com/mook/docker-torbrowser.git
cd docker-torbrowser
docker build -t torbrowser .
```

# Requirements #

- X11 must be running (and the sockets at `/tmp/.X11-unix`)
- xauth

# Running #

Use the [start script](https://github.com/mook/docker-torbrowser/blob/master/start):
```sh
./start
```
