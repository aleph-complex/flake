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
      options = "--delete-older-than 5d";
    }
  };

  # Allow unfree packages
  nixpkgs.config = { allowUnfree = true; };

  system = {
    autoUpgrade = {
      enable = true;
      operation = "boot";
      dates = "daily";
      flake = "github:aleph-complex/flake#complex";
      flags = [ "--refresh" "--commit-lock-file" ];
    };

    stateVersion = "24.05";
  };
}