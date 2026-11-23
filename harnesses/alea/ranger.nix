# https://github.com/ranger/ranger/blob/master/ranger/config/rc.conf
{
  config,
  lib,
  ...
}: let
  cfg = config.harnessed.harnesses.alea;
in {
  config = lib.mkIf cfg.enable {
    programs.ranger = {
      enable = true;
      settings = {
        open_all_images = true;
        preview_images = true;
        preview_images_method = "kitty";
      };
    };
  };
}
