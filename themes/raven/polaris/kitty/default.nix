# Kitty config. See https://sw.kovidgoyal.net/kitty/conf.html
# and https://mynixos.com/home-manager/options/programs.kitty
#
{
  config,
  lib,
  ...
}: let
  polaris = config.themes.raven.polaris;
in {
  config = lib.mkIf polaris.enable {
    home.file = {
      ".config/kitty/Polaris.conf" = {
        source = ./Polaris.conf;
      };
    };

    programs.kitty = {
      enable = true;

      extraConfig = ''
        include Polaris.conf
      '';
    };
  };
}
