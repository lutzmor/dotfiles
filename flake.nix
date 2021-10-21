{
    description = "NixOS configuration";

    # All inputs for the system
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        linux-surface = {
            url = "github:linux-surface/linux-surface";
	    flake = false;
	};

        neovim-nightly-overlay = {
            url = "github:nix-community/neovim-nightly-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # All outputs for the system (configs)
    outputs = { home-manager, nixpkgs, nur, neovim-nightly-overlay, linux-surface, ... }: {
        nixosConfigurations = {

            # Laptop config
            bambam = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit linux-surface; };
                modules = [
		    ./config/hosts/bambam
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.espo = import ./config/users/espo;
                        nixpkgs.overlays = [ 
                            nur.overlay neovim-nightly-overlay.overlay 
                        ];
                    }
                ];
            };

            mirror = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
		    ./config/hosts/mirror
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.espo = import ./config/users/espo;
                        nixpkgs.overlays = [ 
                            nur.overlay neovim-nightly-overlay.overlay 
                        ];
                    }
                ];
            };
        };
    };
}
