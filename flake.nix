{
  description = "complex system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote }: {
    nixosConfigurations.complex = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        lanzaboote.nixosModules.lanzaboote
        ./configuration # Hosts configuration files
      ];
    };
  };
}