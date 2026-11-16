# Harnessed

Framework for harnessing desktop environments.

There are many great theming projects like Hyde that end up going down
over time or authors removing themes.

This one will stay up and grow in variety.

## Orientation

Harnessed can satisfy both system-level and home-manager dotfile
management.

- Add this repo to inputs in `flake.nix`
- Import a theme somewhere under a home-manager user.
- An optional system-level hyprland foundation is also provided.

The list of available themes available for import is in `./flake.nix`

### Home-Manager

The general job of a harness is to provide a common user experience over
a group of themes.

Harnesses are stored under `./harnesses`. Each is a directory with a name.
Consider adding yours via PR.

A user's flake imports themes from their flake's inputs to their own
home-manager. The user's flake is not directly concerned with harnesses;
they are an organizational convenience for managing themes.

Themes are stored under `./themes/<author>/<themes>`. Themes may import
a harness if the author chooses. The onus is on a theme to be compatible
with a harness.

Multiple themes may be imported simultaneously, but this is theme-dependent.
Read a theme's documentation before turning it on.

### System-Level

A system-level hyprland foundation is also provided. It's not required
to be used, but it is guaranteed to work with available themes.

If used, don't let it compete with other system-level desktop environments.
Import it somewhere under a nixosConfiguration.

## Installation

Try the following edits. If they don't work with your flake
then cross-reference with [Raven](https://github.com/digital-raven/raven.git); a nix flake which provides
correct installation and usage.

```
# Add the input to flake.nix
harnessed.url = "https://github.com/digital-raven/harnessed/nixpkgs-25.05";
harnessed.inputs.nixpkgs.follows = "nixpkgs";

# Use the Harnessed provided Hyprland.
# eg. ./some-path/hyprland/default.nix
{
  inputs,
  ...
}: {
  imports = [
    inputs.harnessed.nixosModules.hyprland
  ];
}

# Add to home-manager somewhere.
## eg. ./some-path/hyprland/home-manager/default.nix
{inputs, ...}: {
  imports = [
    inputs.harnessed.themes.raven.polaris
    # Possibly other compliant themes ...
  ];
}
```

## Dynamic Theming

Dynamic theme switching should be a supported. Multiple themes should be
able to be imported simultaneously without issue, provided their files
don't overlap and they don't have any compile-time constraints, like
stylix.

At this time no harnesses or themes have tested this yet.

## Licensure

The License for this repository is GPLv2, but that is intended to pertain
to the code and documentation by the author of this repository. Various
artworks and other assets may be included in themes which are under their
own licensure.

Check the `CREDITS.md` file in any of the themes' directories for authorship
and licensure information on any assets distributed by that theme.

If these 2 models are incompatible IANAL. GPLv2 is a generally nice license
to use on FOSS projects.
