# your system.  Help is available in the configuration.nix(5) man page

{inputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # nix config
  nix = {

    # registry = lib.mapAttrs(_: value: {flake = value; }) inputs;

    # nixPath = lib.mapAttrs(key: value: "${key}=${value.to.path}") config.nix.registry;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
		overlays = [
			inputs.neovim-nightly-overlay.overlay
		];
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "cirrus"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Settings = {
      	AutoConnect = true;
      };
    };
  };
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.picom.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    mouse = {
      naturalScrolling = false;
    };
    touchpad = {
      naturalScrolling = true;
    };
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.scottm = {
    isNormalUser = true;
    description = "Scott";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [
      firefox
      wezterm
      polybar
      rofi
      starship
      networkmanagerapplet
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
    unstable.neovim
    pulseaudio
  ];
  environment.pathsToLink = [ "/share/zsh" ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "22.11";

}
