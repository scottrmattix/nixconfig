{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "cirrus"; # Define your hostname.
  # services.opensnitch.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.scottm = {
    isNormalUser = true;
    description = "Scott";
    extraGroups = ["networkmanager" "wheel" "audio" "jackaudio" "video" "docker" "libvirtd"];
    packages = with pkgs; [
      firefox
      tor-browser-bundle-bin
    ];
    initialHashedPassword = "";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    amdgpu_top
    vulkan-tools
    hwinfo
  ];
  environment.pathsToLink = ["/share/zsh"];
  programs = {
    zsh.enable = true;
    neovim.defaultEditor = true;
    neovim.enable = true;
  };
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  profiles = {
    apps = {
      shortwave.enable = true;
    };
    desktops = {
      hyprland.enable = true;
    };
    suites = {
      common.enable = true;
      development.enable = true;
    };
    system = {
      power.enable = true;
      wireless.enable = true;
      sound.enable = true;
      virtualization.enable = true;
    };
    nix.enable = true;
  };

  networking.firewall.allowedTCPPorts = [
  ];

  system.stateVersion = "22.11";
}
