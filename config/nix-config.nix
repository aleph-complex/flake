{ nixpkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Enable flakes
      auto-optimise-store = true; # Automatically free space by hard linking
    };
    gc = {
      automatic = true;
      dates = "daily";
      persistent = true;
      options = "--delete-older-than 5d";
    };
  };

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };

  system.stateVersion = "24.05";
}