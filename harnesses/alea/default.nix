# Author: Raven, same as repo
# General username: digital-raven
{pkgs, ...}: {
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

  services.swww.enable = true;
  home.file = {
    ".config/Wallpapers/black.png" = {
      source = ./Wallpapers/black.png;
    };
    ".config/Wallpapers/chris-harrison.png" = {
      source = ./Wallpapers/chris-harrison.png;
    };
  };
}
