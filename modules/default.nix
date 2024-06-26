{
  self,
  inputs,
  lib,
  ...
}: let
  inherit (self.lib) genModsFrom;
in {
  flake = {
    nixosModules = genModsFrom {inherit inputs self;} "profiles" ./nixos/profiles;
    #homeManagerModules = importModulesWith ./home {inherit inputs; };
    homeManagerModules = genModsFrom {inherit inputs self;} "profiles" ./home;
  };
}
