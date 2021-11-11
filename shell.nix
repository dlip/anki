{ pkgs ? import <nixpkgs> { } }:
let
  myPython = pkgs.python3.withPackages (pkgs: with pkgs; [ pyliblo pyxdg ]);
in
(pkgs.buildFHSUserEnv {
  name = "bazel-userenv-example";
  targetPkgs = pkgs: with pkgs; [
    curl
    git
    bazel_4
    glibc
    gcc
    #zlib
    #which
    #myPython
  ];
  PYO3_PYTHON = "${myPython}/bin/python3";
}).env
