# Personalized Development Environment

## Philosophy

Personalized Development Environment (PDE) is a concept borrowed from a
[talk](https://www.youtube.com/watch?v=IK_-C0GXfjo) given by TJ DeVries. He
used the term to refer to editors (such as Vim and NeoVim) that are more than
just text editors. However, I would say a good editor is just the core of a
comfortable development environment, just as Linux is the core of the operating
system distribution. A personalized development environment should also include
the whole ecosystem.

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
[Fish](https://fishshell.com) shell, and some essential utilities:

```bash
brew install helix fish starship zoxide
```

Install all the other nice tools in the background:

```bash
set -e _list
set -a _list croc        # transfer stuff from one computer to another
set -a _list dua-cli     # view disk space usage and delete unwanted data
set -a _list dust        # more intuitive version of du
set -a _list eva         # calculator
set -a _list fd          # simple, fast and user-friendly alternative to find
set -a _list fzf         # fuzzy finder
set -a _list ghostty     # terminal emulator
set -a _list hexyl       # hex viewer
set -a _list jless       # json pager
set -a _list jq          # json processor
set -a _list nomino      # batch rename utility
set -a _list pastel      # generate, analyze, convert and manipulate colors
set -a _list raycast     # spotlight/alfred alternative
set -a _list rectangle   # window manager
set -a _list ripgrep     # grep alternative
set -a _list sd          # sed alternative
set -a _list tealdeer    # display simple help page for commands
set -a _list tokei       # code count
brew install $_list
```

## Configuration

Note that all the configurations are wrapped as a custom fish plugin within
this repo. Install all of them with Fisher:

```bash
curl -fsSL https://raw.githubusercontent.com/yxonic/pde/main/install.fish | fish
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

```bash
hx -g fetch && hx -g build
```

### Python

Normal Python development can be handled by [`uv`](https://github.com/astral-sh/uv).
It is a Python package and project manager written in Rust.

For scientific research, install [`micromamba`](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html)
as a conda alternative:
```bash
brew install micromamba
micromamba shell init --shell fish --root-prefix=~/.local/share/mamba
micromamba config set auto_activate_base true
```

Install useful packages:
```bash
mamba install ipython notebook numpy scipy pandas polars matplotlib
```

### Node

It is now possible to use [bun](https://bun.sh/) for all node.js use cases.

To Install:

```bash
curl -fsSL https://bun.sh/install | bash
```

### Rust

Install `rustup` to manage Rust toolchain with ease:

```bash
brew install rustup
rustup default stable
```

### LaTeX

To install LaTeX environment:

```bash
brew install mactex
```
