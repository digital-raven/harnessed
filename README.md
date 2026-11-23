# Harnessed

Framework for harnessing desktop environments.

There are many great theming projects like Hyde that end up going down
over time, authors removing themes...

This one will stay up and grow in variety.

## Orientation

Harnessed can handle your system's entire desktop experience. It does
this by providing system-level default desktop environment(s) and
themes which a user enables with home-manager.

Harnessed is designed to be used by a Nix flake.

- Add this repo to inputs.
- Enable a theme along home-manager.
- Enable the system-level desktop in NixOS.

The system-level desktop environment(s) is optional, but guaranteed
to support the associated themes.

Only Hyprland is currently available as a desktop environment.

## Installation

Try the following edits. If they don't work with your flake
then cross-reference with [Raven](https://github.com/digital-raven/raven.git); a Nix flake with
correct installation and usage.

```
# Inputs in flake.nix
harnessed.url = "https://github.com/digital-raven/harnessed/nixpkgs-25.05";
harnessed.inputs.nixpkgs.follows = "nixpkgs";

# Use the provided Hyprland.
# eg. ./some-path/hyprland/default.nix
{
  inputs,
  ...
}: {
  imports = [
    inputs.harnessed.nixosModules.hyprland
  ];
  
  harnessed.hyprland.enable = true;
}

# Enable a theme along home-manager.
# eg. ./some-path/hyprland/home-manager/default.nix
{inputs, ...}: {
  imports = [
    inputs.harnessed.homeModules.themes
  ];
  
  # Choose one Raven theme at a time.
  #harnessed.themes.raven.nightfall.enable = true;
  harnessed.themes.raven.polaris.enable = true;
  #harnessed.themes.raven.stylix.enable = true;
}
```

## Adding a theme

Copy an existing theme that has features close to what you want
and you'll learn more about theming.

Read the following architecture notes.

### Home-Manager

Themes are provided via home-manager. Look in
`./themes/<author>/<themes>` to see available themes.

Themes may import a harness if the author chooses. The onus
is on a theme to be compatible with a harness.

A harness provides a common user experience across multiple themes.

Harnesses are stored under `./harnesses`. Each is a directory with a name.
Consider adding yours via PR.

A consuming flake is not directly concerned with harnesses; they are an
organizational convenience. Just use as shown in "Installation".

Multiple themes may be enabled simultaneously, but this is theme-dependent.
Read a theme's documentation before enabling it with other themes.

### System-Level

A system-level hyprland foundation is also provided. It's not required
to be used, but it is guaranteed to work with available themes.

Don't activate other desktop environments while using it.

## Dynamic Theming

Dynamic theme switching should be a supported. Multiple themes may be
enabled simultaneously without issue provided the themes don't conflict.

Always read a theme's documentation before enabling it.

In general, if two themes don't overlap files and don't have any
compile-time constraints like stylix then they should be able to be
installed at the same time under a harness which supports dynamic-theming.

A build error may also happen if 2 themes with conflicts are enabled
simultaneously on a configuration depending on the nature of the
conflict.

## License

The License for this repository is GPLv2, but that is intended to pertain
to the code and documentation by the author of this repository. Various
artworks and other assets may be included in themes which are under their
own licenses.

Check the `CREDITS.md` file in any of the themes' directories for authorship
and license information on any assets distributed by that theme.

IANAL. GPLv2 is a generally nice license to use on FOSS projects.
Linus Torvalds used it and we want creatives to feel comfortable sharing
their improvements.
