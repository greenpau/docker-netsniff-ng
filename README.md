# netsniff-ng in a docker container

First, build an image using a Dockerfile:

```
docker build --force-rm=true -t greenpau/netsniff-ng - < Dockerfile
```

Then, start a container using the image and then exit:

```
docker run -i -t --name netsniff-ng greenpau/netsniff-ng /bin/bash
exit
```

Next, save the container in a new image:

```
docker commit -m 'add netsniff-ng binaries' 5ae8b074fb5a greenpau/netsniff-ng
```

Label the image:

```
docker tag 47d01b62a1fb greenpau/netsniff-ng:1.0
docker tag 47d01b62a1fb greenpau/netsniff-ng:latest
```

Finally, push the image to Docker Hub:

``` 
docker push greenpau/netsniff-ng:latest
```

Lastly, test the new image:

```
docker run --rm -i -t --name=netsniff_rx --privileged --cap-add all --net=host -v /tmp:/tmp greenpau/netsniff-ng netsniff-ng --in eth0 -l
```

Additionally, a user could test netsniff-ng tools by running the below command.
The command prints the version of each of the tools in the netsniff-ng suite.

```
make test
```

It invokes the following commands:

```
docker run --rm --read-only greenpau/netsniff-ng netsniff-ng --version
docker run --rm --read-only greenpau/netsniff-ng astraceroute --version
docker run --rm --read-only greenpau/netsniff-ng bpfc --version
docker run --rm --read-only greenpau/netsniff-ng curvetun --version
docker run --rm --read-only greenpau/netsniff-ng flowtop --version
docker run --rm --read-only greenpau/netsniff-ng ifpps --version
docker run --rm --read-only greenpau/netsniff-ng mausezahn --version
docker run --rm --read-only greenpau/netsniff-ng trafgen --version
```
