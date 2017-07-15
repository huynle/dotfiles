# Dotfiles

These dotfiles use [Dotbot](https://github.com/anishathalye/dotbot) for installation.

# Inspiration
- https://github.com/mhartington/dotfiles


## Dependencies

* general
    * `python`
    * `git`

## Installation

```bash
~$ git clone --recursive https://github.com/vsund/dotfiles .dotfiles
```

For installing a predefined profile:

```bash
~/.dotfiles$ ./install-profile <profile> [<configs...>]
# see meta/profiles/ for available profiles
```

For installing single configurations:

```bash
~/.dotfiles$ ./install-standalone <configs...>
# see meta/configs/ for available configurations
```

You can run these installation commands safely multiple times, if you think that helps with better installation.


## Contents

### Profiles

```
meta/profiles/
├── workstation
└── workstation-minimal
```

### Dotbot configurations

```
meta/configs/
├── bash.yaml
├── dunst.yaml
├── fonts.yaml
├── git.yaml
├── gnupg.yaml
├── gtk.yaml
├── i3.yaml
├── icons.yaml
├── parcellite.yaml
├── profile.yaml
├── qt.yaml
├── teiler.yaml
├── terminal-colors.yaml
├── termite.yaml
├── vim.yaml
├── x11.yaml
└── youtube-dl.yaml
```
