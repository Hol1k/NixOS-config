{ pkgs, config, lib, ... }:

{
  home.packages = [
    (pkgs.unityhub.override {
      extraLibs = fhsPkgs: [
        fhsPkgs.ncurses
        fhsPkgs.zlib
        fhsPkgs.icu
        fhsPkgs.openssl
      ];
      extraPkgs = fhsPkgs: [
        fhsPkgs.harfbuzz
        fhsPkgs.libogg
      ];
    })
  ];
}
