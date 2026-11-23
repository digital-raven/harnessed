{
  config,
  lib,
  ...
}: let
  cfg = config.harnessed.themes.raven.nightfall;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/rofi/theme.rasi" = {
        source = ./theme.rasi;
      };
    };
  };
}
