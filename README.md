node-docker-container
=====================

hello world docker node ubuntu


https://github.com/dotcloud/docker
They have a nice polished website to boot, but the README gives a
fairly dense overview.

Written in GO, it leverages host linux kernel LXC feature along with a
suite of commands and APIs to kind of standardize how a system gets
assembled.

Here's an example of how it works:
https://github.com/bewest/node-docker-container/blob/master/Dockerfile

This description gets passed into docker's I/O layer, a daemon with a
queryable API, which appears to perform some kind of hashing on
everything going in and out.  The hashes allow the tools to track
provenance of the steps and commands being run to create a system, so
that it can cache most intermediate steps using the hashed identifier.
The `ADD` command breaks the caching mechanism in the same way that
`git rebase` breaks breaks commit lineage.  The tools allow you to
apply sane names to the hashed identifiers, and to run commands as you
would expect if you were logged into the system.  It's quite elegant.

They try to emulate some of git mechanics, but it's still a very young
project; unlike git the workflows are bit crufty.

I took a default ubuntu image and installed node js on it.
https://index.docker.io/u/bewest/node-docker-container/

Eventually for FDA, I imagine we will want to be able to assert that
we controlled every step of the creation/deployment of the server
software, with a "golden image" as the result.  Not sure how much
docker may actually help or not with that, but it's definitely turning
out to be easier to deal with than chef or puppet, etc.  The way it
caches intermediate steps and leverages LXC for something like a very
cheap VM feels very nice to use.

The rising usage pattern is to install just the daemons you need in a
"container", and then mix and match as many containers, treating them
all as embedded apps.

Since the host needs to have the LXC kernel feature, it's common to
use vagrant to set up an initial host, but it was just as easy to
update my laptop's kernel without extra tools.

