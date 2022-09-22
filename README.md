# Personalized Development Environment

## Philosophy

Personalized Development Environment (PDE) is a concept borrowed from a [talk]
(https://www.youtube.com/watch?v=IK_-C0GXfjo) given by TJ DeVries. He used the
term to refer to editors (such as Vim and NeoVim) that are more than just text
editors. However, I would say a good editor is just the core of a comfortable
development environment, just as Linux is the core of the operating system
distribution. A personalized development environment should also include the
whole ecosystem.

Configuring and reproducing a PDE is hard. When I have to migrate from one
computer to another, it has always been hard for me to remember all the
toolings that I use, let alone restoring all the configurations I made. Instead
of trying to write down every step I take, I decide to manage the **process**
with code as much as possible.

This project maintains the instructions, toolings and configurations needed to
quickly reproduce a PDE on any machine. It is just for myself and my workflow,
but if you are reading this, hope you could also learn something here.

## Bootstraping

### macOS

On having a new machine, the first thing to do is to install a package manager.
This enables easy installation for all the following utilities. For macOS, this
should be [Homebrew](https://brew.sh/):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Afterwards, install the [Helix](https://helix-editor.com) editor, the [Fish]
(https://fishshell.com) shell, the [Alacritty](https://alacritty.org) terminal,
and the Rectangle window manager:

```bash
brew install helix fish alacritty rectangle
```

Install all the nice utilities in the background:

```bash
brew install dust eva fd fzf hexyl jless just mdbook nomino pueue ripgrep sd starship tealdeer tokei zoxide
```

Finally, in a Fish shell, install Fisher for managing fish plugins:

```bash
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

## Configuration

Note that all the configurations are wrapped as a custom fish plugin within
this repo. Install all of them with Fisher:

```fish
fisher install yxonic/pde
```

This will install:

- Custom shell functions such as `proxy`.
- Paths and other common variables.
- My favorite shell aliases.
- Configuration files for other tools such as `hx`.

## Language environment

### Editor

The helix editor needs some configuration to support as much languages as
possible. Simply run:

```fish
hx -g fetch && hx -g build
```

### Rust

### Python

### Node

### LaTeX
