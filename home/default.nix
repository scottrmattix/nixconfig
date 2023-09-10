{
  inputs,
  lib,
  self,
  withSystem,
  ...
}: let
  inherit (self.lib) genUsers collectOptions;
  mkHome = user: configuration: {system ? "x86_64-linux", ...}:
    withSystem system ({
      pkgs,
      lib,
      system,
      ...
    }:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs self pkgs;};
        modules = with inputs;
          [
            # hyprland.homeManagerModules.default
            (import configuration)
          ]
          ++ (collectOptions self.homeManagerModules);
      });

  generatedUsers = genUsers mkHome ./users;
in {
  flake = {
    homeConfigurations = with generatedUsers; {
      scottm = scottm {};
    };
  };
}
