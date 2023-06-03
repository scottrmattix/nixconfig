{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "cirrus"; # Define your hostname.

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
    extraGroups = ["networkmanager" "wheel" "audio"];
    packages = with pkgs; [
      firefox
      wezterm
      starship
      tor-browser-bundle-bin
      texlive.combined.scheme-full
      xclip
      xsel
    ];
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
  ];
  environment.pathsToLink = ["/share/zsh"];
  programs.zsh.enable = true;

  profiles = {
    apps = {
      shortwave.enable = true;
    };
    desktops = {
      i3.enable = true;
      displaymanagers.lightdm.enable = true;
    };
    suites = {
      common.enable = true;
      development.enable = true;
    };
    system = {
      power.enable = true;
      wireless.enable = true;
      sound.enable = true;
    };
    nix.enable = true;
  };

  networking.firewall.allowedTCPPorts = [
  8080
  ];

  system.stateVersion = "22.11";
}
