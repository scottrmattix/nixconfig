{inputs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
    qemu.swtpm.enable = true;
  };
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [qemu];
  programs.virt-manager.enable = true;
  systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];
}
