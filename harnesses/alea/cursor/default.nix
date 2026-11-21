# Installs the cursor package.
{
  config,
  lib,
  ...
}: let
  cfg = config.harnesses.alea;
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      ".local/share/icons/AncientFuturism" = {
        source = ./AncientFuturism;
        recursive = true;
      };
      ".local/share/icons/default" = {
        source = ./default;
        recursive = true;
      };
    };
  };
}
