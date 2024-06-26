{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.beancal = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cal.dconf.settings."org/gnome/desktop/wm/preferences".button-layout = ":";
          home-manager.users.cal.home = {
            stateVersion = "22.05";
            file.".config/sway/config" = {
              source = ./sway.config;
            };
            file."scripts/statusbar.sh" = {
              source = ./statusbar.sh;
              executable = true;
            };
          };
        }
      ];
    };
  };
}