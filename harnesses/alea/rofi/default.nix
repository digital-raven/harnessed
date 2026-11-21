# Harness Rofi expects a theme to provide a theme.rasi file
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.harnesses.alea;
in {
  config = lib.mkIf cfg.enable {
    programs.rofi.enable = true;

    home.file = {
      ".config/rofi" = {
        source = ./rofi;
        recursive = true;
      };
    };

    home.packages = with pkgs; [
      imagemagick # Used by wallpaper selection.
    ];
  };
}
