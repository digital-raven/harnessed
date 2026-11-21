# Stylix based on tokyo-night-storm
#
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.themes.raven.stylix;
in {
  config = lib.mkIf cfg.enable {
    stylix.enable = true;

    # Stylix can generate a color scheme from a wallpaper, or load a pre-made scheme.
    #stylix.image = ./Wallpapers/castle.jpg;
    #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    stylix.base16Scheme = {
      base00 = "1d202f";
      base01 = "414868";
      base02 = "f7768e";
      base03 = "ff899d";
      base04 = "9ece6a";
      base05 = "9fe044";
      base06 = "e0af68";
      base07 = "faba4a";
      base08 = "7aa2f7";
      base09 = "8db0ff";
      base0A = "bb9af7";
      base0B = "c7a9ff";
      base0C = "7dcfff";
      base0D = "a4daff";
      base0E = "a9b1d6";
      base0F = "c0caf5";
    };

    #stylix.autoEnable = false;
    stylix.targets.firefox.enable = false; # Todo: firefox doesn't seem to apply
    #stylix.targets.firefox.profileNames = ["default"];
    stylix.targets.hyprland.enable = false;
    stylix.targets.hyprlock.enable = false;
    stylix.targets.kitty.enable = true;
    stylix.targets.rofi.enable = true;
    stylix.targets.waybar.enable = false; # Go read how to update waybar
  };
}
