{ p ? import <nixpkgs> {} }:
let
  pkgs = import (p.fetchFromGitHub {
    owner = "bheesham";
    repo = "nixpkgs";
    rev = "894fa04458a48412a575154bc6986f8fdd62db0e";
    sha256 = "MjE0JaFVYamxe45Z1sDHMShk21jjxSCTa5Sdk4w8Mwg=";
  }) p;
in
  with pkgs;
  mkShell {
    nativeBuildInputs = [ cmake pkg-config python3 git ];
    buildInputs = [
      curl
      dht
      inotify-tools
      libb64
      libdeflate
      libevent
      libiconv
      libnatpmp
      libpsl
      libutp
      miniupnpc
      openssl
      pcre
      systemd
      zlib
      gtest
      # Helpers
      clang-tools
      nodejs
    ];
  }
