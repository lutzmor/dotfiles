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

        lutzmor-vsc.url = "github:lutzmor/visual-studio-code-insiders-nix";
    };

    # All outputs for the system (configs)
    outputs = { home-manager, nixpkgs, nur, neovim-nightly-overlay, linux-surface, lutzmor-vsc,... }: {
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
                            (self: super: rec {
                                vscodelutz = super.vscode.overrideAttrs (old: {
                                    postInstall = old.postInstall or "" + ''
                                        echo "
                                            <!-- Copyright (C) Microsoft Corporation. All rights reserved. -->
                                            <!DOCTYPE html>
                                            <html>
                                                <head>
                                                <meta charset= \"utf-8\" />
                                                </head>
                                                <body aria-label=\"\">
                                                </body>
                                                <!-- Init Bootstrap Helpers -->
                                                <script src=\"../../../../bootstrap.js\"></script>
                                                <script src=\"../../../../vs/loader.js\"></script>
                                                <script src=\"../../../../bootstrap-window.js\"></script>
                                                <!-- Startup via workbench.js -->
                                                <script src=\"workbench.js\"></script>
                                                <style>
                                                    .editor-actions {
                                                        display: none !important;
                                                    }
                                                    .monaco-workbench .part>.composite.title>.title-actions {
                                                        display: none !important;
                                                    }
                                                    .title-actions > .monaco-toolbar > .monaco-action-bar > .actions-container > .action-item > .action-label.icon.explorer-action {
                                                        display: none !important;
                                                    }
                                                    .editor-actions > .monaco-toolbar > .monaco-action-bar {
                                                        display: none !important;
                                                    }
                                                </style>
                                            </html>" > $out/lib/vscode/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html
                                            cp $out/lib/vscode/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html $out/lib/vscode/resources/app/out/vs/code/electron-browser/workbench/workbench.html
                                    '';
                                });
                            })
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
