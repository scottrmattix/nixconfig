inputs: let
  inherit (inputs.nixpkgs) lib;

  utils = import ./utils.nix lib;
  importers = import ./importers.nix lib;
  generators = import ./generators.nix lib;
  filter-packages = import ./filter-packages.nix;
in
  lib.extend (_: _: importers // generators // filter-packages // utils)
