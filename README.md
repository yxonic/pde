# Personalized Development Environment

## Philosophy

Personalized Development Environment (PDE) is a concept borrowed from a
[talk](https://www.youtube.com/watch?v=IK_-C0GXfjo) given by TJ DeVries. He
used the term to refer to editors (such as Vim and NeoVim) that are more than
just text editors. However, I would say a good editor is just the core of a
comfortable development environment, just as Linux is the core of the operating
system distribution. A personalized development environment should also include
the whole ecosystem.

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

Afterwards, install the [Helix](https://helix-editor.com) editor, the
[Fish](https://fishshell.com) shell, the [Alacritty](https://alacritty.org)
terminal, and the Rectangle window manager:

```bash
brew install helix fish alacritty rectangle
```

Install all the nice utilities in the background:

```bash
brew install croc dua-cli dust eva fd fzf hexyl jless just mdbook nomino pastel pueue ripgrep sd starship tealdeer tokei zoxide
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

Install `rustup` to manage Rust toolchain with ease:

```fish
brew install rustup
```

### Python

Python development is best done in virtual environments. Some of my favorite
virtual environment management tools are `virtualfish` and `conda`.

For python package development, I would use `virtualfish` with `poetry`. They
are both installed with system python:

```fish
brew install python
pip3 install virtualfish
vf addplugins auto_activation
curl -sSL https://install.python-poetry.org | python3 -
```

For scientific research, I would install `miniconda`, since it provides many
ready-to-use scientific packages and libraries.

To enable best editing experience, install following tools **inside** the
virtual environment for helix to pick up:

```fish
pip install python-lsp-server python-lsp-black python-lsp-ruff
```

### Node

I like to manage node versions with `nvm.fish`:

```fish
set -U nvm_default_version lts
set -U nvm_default_packages pnpm
fisher install jorgebucaran/nvm.fish
nvm install lts
```

### LaTeX

To install LaTeX environment:

```fish
brew install mactex
```