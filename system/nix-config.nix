{ nixpkgs, ... }:

{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };

  # Automatically free space by hard linking
  nix.settings.auto-optimise-store = true;
  
  # Configuration version
  system.stateVersion = "24.05";
}