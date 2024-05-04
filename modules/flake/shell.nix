{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    system,
    ...
  }: {
    devShells = let
      inherit (inputs) nixago;

      nvfetcherConfigs = import ./nixago/nvfetcher.nix {inherit pkgs;};
      nixagoConfigs =
        nvfetcherConfigs;
    in {
      default = pkgs.mkShell {
        name = "nix-shell";
        packages = with pkgs;
          [
            config.treefmt.build.wrapper
            lefthook
            node2nix
            nodePackages.prettier
            nvfetcher
          ]
          ++ (builtins.attrValues config.treefmt.build.programs);
        shellHook = ''
          ${(nixago.lib.${system}.makeAll nixagoConfigs).shellHook}
        '';
      };

      # Slimmed-down GH Actions environment for nvfetcher to update packages in
      # This just generates the actual nvfetcher.toml files.
      ci = pkgs.mkShell {
        name = "nix-shell-ci";
        shellHook = ''
          ${(nixago.lib.${system}.makeAll nvfetcherConfigs).shellHook}
        '';
      };
    };
  };
}
