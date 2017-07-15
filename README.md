# Dotfiles Features

- Dotfiles are install with setup script based on profiles
    - Credit and inspiration from [mhartington](https://github.com/mhartington/dotfiles)
- Extensive Vim configuration based off [rafi](https://github.com/rafi/vim-config)
- Hugo is used to write "journal" entries
    - type "journal" and automatic creation of Hugo blog entry is created in folder


## Dependencies

* general
    * `python`
    * `git`
    * `hugo`

## Installation

```bash
~$ git clone --recursive https://github.com/huynle/dotfiles.git .dotfiles
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
├── git.yaml
├── vim.yaml
```
