{
  description = "Flake for Aleph's systems";

# TEMP  lanzaboote, nix-index-database, mac-app-util,

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }: {
    # phobos (ThinkPad)
    nixosConfigurations.phobos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Nix files
        ./phobos

        inputs.lanzaboote.nixosModules.lanzaboote
        inputs.nix-index-database.nixosModules.nix-index
      ];
      specialArgs = {
        inherit inputs;
      };
    };

    # deimos (MacBook Pro)
    darwinConfigurations."deimos" = nix-darwin.lib.darwinSystem {
      modules = [
        # Nix files
        ./deimos

        inputs.nix-index-database.darwinModules.nix-index
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  }; # outputs

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS-like configuration for macOS systems
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Database for nix-index + comma
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }; # inputs
}
