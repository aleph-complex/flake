{
  imports = [
    # Desktop and CLI apps
    ./applications.nix

    # Homebrew config
    ./homebrew.nix

    # Nix package manager
    ./nix-config.nix

    # Networking options
    ./networking.nix
  ];
}
