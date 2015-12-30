# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
      vim
      pkgs.git
      pkgs.gnupg
  #   wget
  ];
  # NOTE(akavel): notes to self:
  #   nix-env -qaP --description  # list all available pkgs
  #   nix-env --dry-run -i git    # dependencies of a pkg
  #   nixos-rebuild dry-build    # do not build
  #   nixos-rebuild build        # build only (generates link named 'result')
  #   nixos-rebuild dry-activate # build & simulate switch (may be incomplete)
  #   nixos-rebuild test         # build & switch OS, but don't set boot default
  #   nixos-rebuild switch       # build & switch OS & set boot default
  #   https://nixos.org/nixpkgs/manual  # how to develop and contribute to NixOS packages
  #   nix-store -q --tree /nix/var/nix/profiles/system  # list installed pkgs and their dependencies; https://nixos.org/wiki/Cheatsheet
  #   nix-store -q --references /var/run/current-system/sw | cut -d- -f2- | sort | less   # list installed NixOS packages; https://nixos.org/wiki/Install/remove_software#How_to_list_installed_software
  #   nix-channel --add https://nixos.org/channels/nixos-unstable nixos   # bleeding edge; enables command-not-found, reportedly? https://github.com/NixOS/nixpkgs/issues/12044

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.akavel = {
    isNormalUser = true;
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
