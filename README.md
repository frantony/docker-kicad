Based on https://github.com/bewster/debian-vnc-desktop-docker


Debian Experimental + KiCad6
============================

```
IMAGE=vnc-desktop-debian-exp
docker build -t $IMAGE -f Dockerfile.debian-exp .

cp ~/.ssh/id_rsa.pub authorized_keys
chmod 600 authorized_keys
BU=/home/builduser
docker run --rm -p 5901:5901 -p 5022:22 \
    -v $(pwd)/authorized_keys:${BU}/.ssh/authorized_keys \
    -v PATH_TO_KICAD_PROJECT:/project \
    -it $IMAGE

LC_ALL="en_US.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US:en" ssh -p 5022 builduser@localhost

```


Debian Bullseye + KiCad5
========================

```
IMAGE=vnc-desktop-debian-bullseye
docker build -t $IMAGE -f Dockerfile.debian-bullseye .
docker run -p 5901:5901 -it $IMAGE
```
