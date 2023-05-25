{
  self,
  lib,
  ...
}: {
  flake.overlays = {
    flakepkgs = _final: prev: {
      formats = (import ./pkgs-lib {inherit (prev) lib pkgs;}).formats // prev.formats;
    };
  };
}
