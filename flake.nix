{
  description = "Nix mono flake config for NixOS and Home-Manager";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    stable = {
      url = "github:nixos/nixpkgs/nixos-22.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    nvfetcher = {
      url = "github:berberman/nvfetcher";
    };
    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt = {
      url = "github:numtide/treefmt-nix";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    stable,
    home-manager,
    nur,
    flake-parts,
    nvfetcher,
    nixago,
    treefmt,
    ...
  } @ inputs: let
    lib = import ./lib inputs;
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = with inputs; [
        treefmt.flakeModule

        ./modules/flake/treefmt.nix
        ./modules/flake/shell.nix
        ./modules/flake/nvfetcher.nix
        ./modules

        ./hosts/nixos
        ./home

        ./overlays

        ./pkgs
      ];
      systems = [
        "x86_64-linux"
      ];
      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        _module.args = {
          inherit self inputs lib;
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              nvfetcher.overlays.default
              self.overlays.default
              self.overlays.flakepkgs
              inputs.neovim-nightly-overlay.overlay
            ];
            config.allowUnfree = true;
          };
        };
      };

      flake = {
        inherit lib;
      };
      debug = false;
    };
}
