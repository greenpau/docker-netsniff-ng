# vim: set ts=8 sw=8 ai noet:

.PHONY: all
all: build

.PHONY: clean
clean:
	docker rmi -f greenpau/netsniff-ng || :

.PHONY: build
build:
	docker build --force-rm=true --no-cache=true --rm=true -t greenpau/netsniff-ng - < Dockerfile
	docker images | grep greenpau/netsniff-ng

.PHONY: test
test:
	docker run --rm --read-only greenpau/netsniff-ng netsniff-ng --version
	docker run --rm --read-only greenpau/netsniff-ng astraceroute --version
	docker run --rm --read-only greenpau/netsniff-ng bpfc --version
	docker run --rm --read-only greenpau/netsniff-ng curvetun --version
	docker run --rm --read-only greenpau/netsniff-ng flowtop --version
	docker run --rm --read-only greenpau/netsniff-ng ifpps --version
	docker run --rm --read-only greenpau/netsniff-ng mausezahn --version
	docker run --rm --read-only greenpau/netsniff-ng trafgen --version
