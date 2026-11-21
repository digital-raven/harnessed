{
  config,
  lib,
  ...
}: let
  cfg = config.themes.raven.nightfall;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/rofi/theme.rasi" = {
        source = ./theme.rasi;
      };
    };
  };
}
