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
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}