{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
    };
    lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        marcus = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/t480/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            ./modules/system/docker.nix
          ];
        };
      };
  
      homeConfigurations = {
        marcus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./users/marcus/home.nix
            ./users/marcus/shell.nix
            ./modules/user/git.nix
            ./modules/user/vscode.nix
          ];
        };
      };
    };
}

