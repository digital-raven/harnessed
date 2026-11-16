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
{localFlake}: {
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../../harnesses/alea

    localFlake.inputs.stylix.homeModules.stylix
    ./rofi
    ./stylix.nix
    ./waybar
  ];

  home.file = {
    ".config/Wallpapers" = {
      source = ./Wallpapers;
      recursive = true;
    };
  };
}
