{
  config,
  lib,
  ...
}: let
  cfg = config.harnessed.themes.raven.polaris;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/waybar/theme.css" = {
        source = ./theme.css;
      };
    };
  };
}
