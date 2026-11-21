# Read the theme.css file for how to deal with stylix.
{
  config,
  lib,
  ...
}: let
  cfg = config.themes.raven.stylix;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/waybar/theme.css" = {
        source = ./theme.css;
      };
    };
  };
}
