{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
  };
  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #   };
  # };
}
