{ pkgs ? import <nixpkgs> {} }:
let
  lexicon = ps: ps.callPackage ./lexicon.nix {};
  python = pkgs.python3.withPackages (p: with p; [
    certbot
    acme
    mock
    pynamecheap
    (lexicon p)
  ]);
in
python.env
