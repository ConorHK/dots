{
  description = "HomeManager dotfiles flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = inputs.home-manager.defaultPackage.x86_64-darwin;
 
    homeConfigurations = {
      "conor" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/knoconor";
        username = "conor"; # TODO: Change to your username
        configuration.imports = [ ./home.nix ];
      };
      "knoconor" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/knoconor";
        username = "knoconor";
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
