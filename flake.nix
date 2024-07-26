{
  description = "complex system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    # Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Database for nix-index + comma
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # COSMIC desktop environment
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, nix-index-database, nixos-cosmic, ... }: {
    nixosConfigurations.complex = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Nix files
        ./config

        lanzaboote.nixosModules.lanzaboote

        nix-index-database.nixosModules.nix-index
        { programs.nix-index-database.comma.enable = true; } # Wraps comma

        nixos-cosmic.nixosModules.default
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          };
        }
      ];
    };
  };
}