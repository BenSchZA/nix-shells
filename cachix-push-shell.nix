#!/bin/sh -ex
nix-store -qR --include-outputs $(nix-instantiate $1) | cachix push $2
