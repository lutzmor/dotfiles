all: build

HOST=$(shell hostname)

build:
	darwin-rebuild build --flake .#${HOST}

switch:
	darwin-rebuild switch --flake .#${HOST}

install:
	./bin/install.sh

update:
	nix flake update
