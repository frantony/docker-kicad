Based on https://github.com/bewster/debian-vnc-desktop-docker


Debian Experimental + KiCad6
============================

```
IMAGE=vnc-desktop-debian-exp
docker build -t $IMAGE -f Dockerfile.debian-exp .
docker run -p 5901:5901 -it $IMAGE
```


Debian Bullseye + KiCad5
========================

```
IMAGE=vnc-desktop-debian-bullseye
docker build -t $IMAGE -f Dockerfile.debian-bullseye .
docker run -p 5901:5901 -it $IMAGE
```
