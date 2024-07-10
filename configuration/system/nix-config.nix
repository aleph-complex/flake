{ nixpkgs, ... }:

{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };
  
  # Configuration version
  system.stateVersion = "24.05";
}