{
  imports = [
    # Boot process, kernel, secureboot
    ./boot.nix

    # COSMIC desktop
    #./cosmic.nix

    # NixOS generated hardware config
    ./hardware-configuration.nix

    # Networking and firewall
    ./networking.nix

    # Nix package manager
    ./nix-config.nix

    # KDE Plasma Desktop
    ./plasma.nix

    # Audio, bluetooth, etc
    ./services.nix

    # Defines the user account
    ./user.nix
  ];
}
