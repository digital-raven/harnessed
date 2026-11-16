{
  description = "Harness Hyprland";

  inputs = {
    nixpkgs.url = "github:digital-raven/nixpkgs/nixos-25.05";

    home-manager.url = "github:digital-raven/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:digital-raven/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    systems = [
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
    localFlake = {inherit inputs self;};
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # System-level desktop modules. Import 1 via
    # eg. imports = [inputs.harnessed.nixosModules.hyprland];
    nixosModules = {
      # Bare-minimum hyprland
      hyprland = ./hyprland.nix;
    };

    # Home-manager themes. Import 1 via
    # eg. imports = [inputs.harnessed.themes.<author>.<theme>];
    themes = {
      # new-author = {
      #   new-theme = ./themes/new-author/new-theme;
      # };
      raven = {
        # Usage: Import only one raven theme at a time. Thanks, stylix.
        nightfall = nixpkgs.lib.modules.importApply ./themes/raven/nightfall {
          inherit localFlake;
        };
        polaris = nixpkgs.lib.modules.importApply ./themes/raven/polaris {
          inherit localFlake;
        };
        stylix = nixpkgs.lib.modules.importApply ./themes/raven/stylix {
          inherit localFlake;
        };
      };
    };
  };
}
