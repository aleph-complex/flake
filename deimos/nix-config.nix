{ inputs, ... }:

{
  # Auto upgrade nix and nix-daemon service.
  services.nix-daemon.enable = true;
  
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enable flakes
      auto-optimise-store = true; # Automatically free space by hard linking
    };
  };

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };

  # Enable aarch64 and x86-64 support
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.extra-platforms = [ "x86_64-darwin" ];

  # Use nixpkgs from the flake
  nix.registry.nixpkgs.flake = inputs.nixpkgs;

  # Enable TouchID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}