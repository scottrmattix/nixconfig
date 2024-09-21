{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "scottm";
    homeDirectory = "/home/scottm";
  };
  home.packages = with pkgs; [
    openscad-unstable
    inkscape-with-extensions
    krita
    blender
    freecad
    zathura
    discord
    kicad
    audacity
  ];
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  profiles = {
    git.enable = true;
    zsh.enable = true;
    wezterm.enable = true;
    starship.enable = true;
    zellij.enable = true;
    helix.enable = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    stdlib = ''
      : "''${XDG_CACHE_HOME:="''${HOME}/.cache"}"
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
          local hash path
          echo "''${direnv_layout_dirs[''$PWD]:=''$(
              hash="''$(sha1sum - <<< "''$PWD" | head -c40)"
              path="''${PWD//[^a-zA-Z0-9]/-}"
              echo "''${XDG_CACHE_HOME}/direnv/layouts/''${hash}''${path}"
          )}"
      }
    '';
  };

  home.stateVersion = "23.11";
}
