# Installs the cursor package.
{...}: {
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
}
