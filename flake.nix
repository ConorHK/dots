{
  description = "HomeManager dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nvim.url = "github:conorhk/vimrc";
    nvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, nvim, ...}@inputs:
    let
    system = "x86_64-linux";
  lib = nixpkgs.lib;
  pkgs = nixpkgs.legacyPackages.${system};
  in {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations = {
      "knoconor" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
        {
          home.packages = [ nvim.packages.${system}.default ];
        }
        ./home.nix 
        ];
      };
    };
  };
};
}
