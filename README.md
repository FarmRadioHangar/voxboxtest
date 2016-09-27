# voxbox
voxbox on resin.io


# Table of contents
- [ ] [Introduction]()
  - [x] [overview](#overview)
  - [x] [installation](#installation)
  - [x] [how it works](#how it works)
- [ ] [components](#components)
  - [x] [fconf](#fconf)
  - [x] [telegraf](#telegraf)
  - [x] [frontend](#frontend)
  - [ ] [backend](#backend)
  - [ ] [asterisk](#asterisk)

# overview
This is a test case, which attempts to deploy the voxbox stack on a raspberry pi
3 using resion.io.

The whole stack is running inside the docker containers.`docker-compose` is used
to bootstrap the whole stack.

# Installation

You need to clone this repository somewhere in our local machine and must have a
device that is running a fresh copy of resin image.

You can now add the  git remote that points to your resin git repository then
push to it for deployment.

```bash
git clone git@github.com:FarmRadioHangar/voxboxtest.git

cd voxbox

git remote add resin {YOUR resin username}@git.resin.io:{YOUR RESIN USERNAME}/{YOUR APPLICATION NAME}.git

git push resin master
```

# How it works

This works by running docker within docker. Since resin only allows your
application to run in a single container, we run all the componets as containers
inside this main container.

`docker-compose` is used to compose the whole stack. You should be warned that
it is not a good idea to use docker compose in production. But `docker-compose`
is the best tool for this kind of problem. In the future, maybe systemd can be
used to replace `docker-compose`


# Components

## fconf
This is used for configuring devices, and other stuffs that are necessary for
running voxbox. It is a golang application that relies on c bindings for
lib-udev . For some reasons, this doesn't compile from source as there are
odifications needed for one of the go libraries to make it work.

So, fconf binary is included in this project at `/voxbox/fconf/fconf` . The
service runs on port `8090`

Configuration for the service is mounted on `/etc/fconf/fconf.json` . So any
updates on configuration can be done there, this will require restarting of the
container.
