{
  lib,
  inputs,
  self,
  withSystem,
  ...
}: let
  inherit (self.lib) importModules collectLeaves genModules genHosts collectOptions;

  mkNixOS = hostname: configuration: {system ? "x86_64-linux", ...}:
    withSystem system ({
      pkgs,
      lib,
      system,
      ...
    }:
      lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit self inputs lib pkgs;
        };
        modules = with inputs;
          [
            nur.nixosModules.nur
            home-manager.nixosModules.home-manager
            (import configuration)
            {
              networking.hostName = hostname;
              users.mutableUsers = true;
              nixpkgs = {
                inherit pkgs;
                config.allowUnfree = true;
              };
            }
          ]
          ++ (collectOptions self.nixosModules);
      });

  generatedHosts = genHosts mkNixOS ./machines;
in {
  flake = {
    nixosConfigurations = with generatedHosts; {
      cirrus = cirrus {};
    };
  };
}
