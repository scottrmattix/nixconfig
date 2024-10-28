{inputs, ...}: {
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gdb
  ];
  xdg.configFile = {
    "gdb/gdbinit".source = ./gdbinit;
  };
}
