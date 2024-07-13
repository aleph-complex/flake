{
  description = "complex system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, lanzaboote, nix-index-database, ... }: {
    nixosConfigurations.complex = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration # Hosts configuration files
        lanzaboote.nixosModules.lanzaboote
        nix-index-database.nixosModules.nix-index
        { programs.nix-index-database.comma.enable = true; }
      ];
    };
  };
}