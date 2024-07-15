{
  imports = [
    # Boot process, kernel, secureboot
    ./boot.nix

    # COSMIC desktop
    #./cosmic.nix

    # NixOS generated hardware config
    ./hardware-configuration.nix

    # Nix package manager
    ./nix-config.nix

    # KDE Plasma Desktop
    ./plasma.nix

    # System hardening
    ./security.nix

    # Audio, bluetooth, networking
    ./services.nix

    # Defines the user account
    ./user.nix
  ];
}