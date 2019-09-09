#!/usr/bin/env nix-shell
#!nix-shell -i runghc -p "ghc.withPackages (ps: [ ps.HTTP ])"

import Network.HTTP

main = return ()
