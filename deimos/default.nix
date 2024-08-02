{
  imports = [
    # Desktop and CLI apps
    ./applications.nix

    # Nix package manager
    ./nix-config.nix

    # Networking options
    ./networking.nix
  ];
}