{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    system,
    ...
  }: {
    devShells = {
      # nvfetcherConfigs = import ./nixago/nvfetcher.nix {inherit pkgs;};
      # nixagoConfigs =
      # nvfetcherConfigs;{
      default = pkgs.mkShell {
        name = "nix-shell";
        packages = with pkgs; [
          # config.treefmt.build.wrapper
          lefthook
          # node2nix
          # nodePackages.prettier
          # nvfetcher
        ];
        # ++ (builtins.attrValues config.treefmt.build.programs);
        # shellHook = ''
        #   ${(nixago.lib.${system}.makeAll nixagoConfigs).shellHook}
        # '';
      };

      # ci = pkgs.mkShell {
      #   name = "nix-shell-ci";
      #   shellHook = ''
      #     ${(nixago.lib.${system}.makeAll nvfetcherConfigs).shellHook}
      #   '';
      # };
    };
  };
}
