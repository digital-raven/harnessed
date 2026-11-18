# Harnessed

Framework for harnessing desktop environments.

There are many great theming projects that end up going down
over time or authors removing themes. Hyde was good.

This one will stay up and grow in variety.

## Usage

This repo is intended to be used by a Nix flake. The `nixos-*`
branches follow the respective release of nixpkgs.

All content for this repository is along other branches. All themes along
these branches were tested working at time of release. Some minor bugs may
still slip by.

The individual branches have more technical information, but
the general idea is fork/clone this repo and add it to inputs
in `flake.nix`

## Licensure

The License for this repository is GPLv2, but that is intended to pertain
to the code and documentation by the author of this repository. Various
artworks and other assets may be included in themes which are under their
own licensure.

Check the `CREDITS.md` file in any of the themes' directories for authorship
and licensure information on any assets distributed by that theme.

If these 2 models are incompatible IANAL. GPLv2 is a generally nice license
to use on FOSS projects.
