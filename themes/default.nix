# Raven theme imports
{localFlake}: {...}: {
  imports = [
    # Import by author
    ./raven

    # 3rd party requirements
    localFlake.inputs.stylix.homeModules.stylix
  ];
}
