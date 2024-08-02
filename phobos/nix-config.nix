{ inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enable flakes
      auto-optimise-store = true; # Automatically free space by hard linking
    };
  };

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };

  system.stateVersion = "24.05";
}