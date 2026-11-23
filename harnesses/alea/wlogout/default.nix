# Inoffensive wlogout
{
  config,
  lib,
  ...
}: let
  cfg = config.harnessed.harnesses.alea;
in {
  config = lib.mkIf cfg.enable {
    programs.wlogout.enable = true;

    home.file = {
      ".config/wlogout" = {
        source = ./wlogout;
        recursive = true;
      };
    };
  };
}
