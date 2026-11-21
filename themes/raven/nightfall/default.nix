# Nightfall was first.
#
# Author: Raven
# Username: digital-raven
#
# Terminal: kitty
# File explorer: nautilus
# Bar: waybar
# App launcher: rofi
# Wallpaper: swww
# Screenshot: grimblast
# Color picker: hyprpicker
# Misc: wlogout, hyprlock, hypridle
#
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.themes.raven.nightfall;
in {
  imports = [
    # Local
    ./rofi
    ./stylix.nix
    ./waybar

    # Harness
    ../../../harnesses/alea
  ];

  # Define enable option.
  options.themes.raven.nightfall = {
    enable = lib.mkEnableOption "Enable theme.";
  };

  # If theme enabled
  config = lib.mkIf cfg.enable {
    # Enable harness
    harnesses.alea.enable = true;

    # Wallpapers
    home.file = {
      ".config/Wallpapers" = {
        source = ./Wallpapers;
        recursive = true;
      };
    };
  };
}
