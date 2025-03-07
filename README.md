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
[Fish](https://fishshell.com) shell, the [Ghostty](https://ghostty.org)
terminal, [raycast](https://www.raycast.com), and the [Rectangle](https://rectangleapp.com/)
window manager:

```bash
brew install helix fish ghostty raycast rectangle
```

Install all the nice utilities in the background:

```bash
set -e list
set -a list croc        # transfer stuff from one computer to another
set -a list dua-cli     # view disk space usage and delete unwanted data
set -a list dust        # more intuitive version of du
set -a list eva         # calculator
set -a list fd          # simple, fast and user-friendly alternative to find
set -a list fzf         # fuzzy finder
set -a list hexyl       # hex viewer
set -a list jless       # json pager
set -a list jq          # json processor
set -a list nomino      # batch rename utility
set -a list pastel      # generate, analyze, convert and manipulate colors
set -a list ripgrep     # grep alternative
set -a list sd          # sed alternative
set -a list starship    # cross-shell prompt
set -a list tealdeer    # tldr
set -a list tokei       # code count
set -a list zoxide      # shell extension for fs navigation
brew install $list
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

Manage node versions and projects with [`pnpm`](https://pnpm.io):
```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

In a new shell, use pnpm to install node lts version:
```bash
pnpm env use --global lts
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
