{
  description = "espo's env";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, home, nixpkgs, ... }@inputs: {
    darwinConfigurations.suiko = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        ./machines/suiko/configuration.nix
        ./setup/home/default.nix
        home.darwinModule
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];      
    };
    nixosConfigurations.macbook = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/macbook/configuration.nix
      ];
    };
    nixosConfigurations.compute1 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/compute1/configuration.nix
      ];
    };
    nixosConfigurations.compute2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/compute2/configuration.nix
      ];
    };
  };
}
