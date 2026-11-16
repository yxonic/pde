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
should be [MacPorts](https://www.macports.org/), which still supports Intel
Macs. Install Xcode Command Line Tools first, then the MacPorts package for
your macOS version from the [installation page](https://www.macports.org/install.php):

```bash
xcode-select --install
```

Afterwards, install the [Helix](https://helix-editor.com) editor, the
[Fish](https://fishshell.com) shell, and some essential utilities:

```bash
sudo port install helix fish starship zoxide
```

Make fish the login shell, so that terminals and editors all pick it up:

```bash
echo /opt/local/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/local/bin/fish
```

Install all the other nice tools in the background:

```bash
set -e _list
set -a _list ripgrep     # grep alternative
set -a _list fd          # simple, fast and user-friendly alternative to find
set -a _list gh          # github cli
set -a _list jq          # json processor
set -a _list jless       # json pager
set -a _list dust        # more intuitive version of du
set -a _list tokei       # code count
set -a _list yt-dlp      # video downloader
set -a _list ffmpeg      # audio/video converter
sudo port install $_list
```

MacPorts does not ship GUI apps. Download these from their websites:

- [Ghostty](https://ghostty.org): terminal emulator
- [Cursor](https://cursor.com): editor
- [Google Chrome](https://www.google.com/chrome/): browser
- [Clash Verge Rev](https://github.com/clash-verge-rev/clash-verge-rev): proxy
- [Rectangle](https://rectangleapp.com): window manager
- Tinycast: spotlight/alfred alternative
- [Keka](https://www.keka.io): archiver
- [iStat Menus](https://bjango.com/mac/istatmenus/): system monitor
- OpenLogi: Logitech device driver
- [WeChat](https://mac.weixin.qq.com), [Tencent Meeting](https://meeting.tencent.com), [Telegram](https://telegram.org): communication

## Configuration

Note that all the configurations are wrapped as a custom fish plugin within
this repo. Install all of them with:

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
sudo port install micromamba
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
sudo port install rustup
rustup default stable
```

### LaTeX

To install LaTeX environment, download [MacTeX](https://www.tug.org/mactex/),
or install TeX Live from MacPorts:

```bash
sudo port install texlive
```
