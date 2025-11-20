{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

      hyprland.url = "github:hyprwm/Hyprland";
       hyprland-plugins = { url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    split-monitor-workspaces = {
    url = "github:Duckonaut/split-monitor-workspaces";
    inputs.hyprland.follows = "hyprland";
  };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
              };

  };

  #inputs.ryujinx.url = "github:Naxdy/Ryujinx";

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, hyprland-plugins, split-monitor-workspaces, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # Termial-416 - system hostname
    nixosConfigurations.Terminal-416 = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
      ];
    };

    homeConfigurations.kim = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
      modules = [ ./home-manager/home.nix ];
    };
  };
}
