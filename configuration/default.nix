{
  imports = [
    # Desktop applications
    ./applications/applications.nix

    # Boot process, kernel, secureboot
    ./system/boot.nix

    # Chromium browser
    ./applications/chromium.nix

    # Command line tools
    ./applications/cli-utilities.nix

    # Gaming applications
    ./applications/gaming.nix

    # NixOS generated hardware config
    ./system/hardware-configuration.nix

    # Nix package manager
    ./system/nix-config.nix

    # KDE Plasma Desktop
    ./system/plasma.nix

    # System hardening
    ./system/security.nix

    # Audio, bluetooth, networking
    ./system/services.nix

    # Defines the user account
    ./system/user.nix
  ];
}