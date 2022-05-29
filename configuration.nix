# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s5.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  environment.shells = [ pkgs.bashInteractive pkgs.zsh ];
  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jarvisluong = {
     isNormalUser = true;
     home = "/home/jarvisluong";
     openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaSJ0pAzaptoNqR0Mrfx2IWRQ+XixGffiEftMUolM7iwjNQVVAbg9dOVhgj1vHIWaBjlgy2ZoyfA5d6njwZ9EzKSfP7dLx8z68E4aYnoTiTvaZTv31h2OcUPLjqnKyeEz+ZD9wT2jEjzzUMJfBpDVf4Y1PjDBo4J0r4tRab+lvj66Y2N7YGRVX8YcDThFcFH0g3xtRCE2MAwiW71PzNkP8bfyBX5zUHZ3j8Zot7MhLSM9Cz3DMG0DPk57gi2uT6rBMp+OOJjrDcu+HjCZuvt6h2eY0eao5y+TYjLIXcBjjjpi0H/2P8joH2VwepjRkziYzUq/Wi3w21MSfV+6iBLovQP3s/1dfLtPgLgm4FYn0Bn+/pysCJwvCQBWMChdTz+/Ll6xgqJir8qgxoPLgcajwnYAFpLfLdHDvX8N8B7yNZ/DOhEy8lBD5CaH8FOu43vS3nkzD26y/vfq64dZrwslYBPjxDNKMP2fGA9MU63CUEDMEGOEQYN1ihPaORYcW4dM= jarvisluong@Hais-MacBook-Air.local
"];
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.zsh;
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  #   firefox
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

