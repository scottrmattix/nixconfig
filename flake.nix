{
  description = "Nix mono flake config for NixOS and Home-Manager";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };
    unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixago = {
      url = "github:nix-community/nixago";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # eww = {
    #   url = "github:elkowar/eww";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    unstable,
    home-manager,
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
              # inputs.neovim-nightly-overlay.overlay
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
