{
  config,
  lib,
  ...
}: let
  cfg = config.themes.raven.polaris;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/rofi/theme.rasi" = {
        source = ./theme.rasi;
      };
    };
  };
}
