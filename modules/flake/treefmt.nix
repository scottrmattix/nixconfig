{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    settings = {
      projectRootFile = "flake.nix";
      programs.alejandra.enable = true;
      programs.prettier.enable = true;
      programs.shfmt.enable = true;
    };
  in {
    treefmt = {
      config = settings;
    };

    formatter = inputs.treefmt.lib.mkWrapper pkgs settings;
  };
}
