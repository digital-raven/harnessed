# Author: Raven, same as repo
# General username: digital-raven
{
  config,
  lib,
  ...
}: let
  cfg = config.harnesses.alea;
in {
  imports = [
    ./cursor
    ./hyprland
    ./hyprlock
    ./kitty
    ./ranger.nix
    ./rofi
    ./waybar
    ./wlogout
  ];

  options.harnesses.alea = {
    enable = lib.mkEnableOption "Enable harness.";
  };

  config = lib.mkIf cfg.enable {
    services.swww.enable = true;
    home.file = {
      ".config/Wallpapers/black.png" = {
        source = ./Wallpapers/black.png;
      };
      ".config/Wallpapers/chris-harrison.png" = {
        source = ./Wallpapers/chris-harrison.png;
      };
    };
  };
}
