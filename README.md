# SAEMC's Tmux-Configs

## Prerequisites

### Recommended

#### OS version

- Ubuntu >= 20.04 LTS
- macOS >= Big Sur

#### Install and apply

- SAEMC's [iTerm2-Configs](https://github.com/SAEMC/iTerm2-Configs.git)

### (Optional) Install `sudo` and `git`

- If you'd never installed, run the following command

```shell
apt-get update && apt-get install -y sudo git
```

### Clone this repository

```shell
git clone https://github.com/SAEMC/Tmux-Configs && \
cd ./Tmux-Configs/
```

<br/>

## Installation

- Enter following command: `./tmux_configs.sh [OPTION]` (must be in `Tmux-Configs` directory)

### Recommended

- Install dependencies and write scripts

```shell
./tmux_configs.sh -a
```

### Install partially

#### Install dependencies

```shell
./tmux_configs.sh -d
```

#### Write scripts

```shell
./tmux_configs.sh -s
```

### Activate dependencies in current shell

#### Ubuntu

```shell
source ~/.bashrc
```

#### macOS

```shell
source ~/.zshrc
```

### Remove this repository

```shell
cd .. && rm -r ./Tmux-Configs/
```

### Install plugins

- `<Ctrl>` + `<Space>` + `<Shift>` + `i`: Install plugins

<br/>

## Usages

### The changed commands

#### The prefix has been changed from `<Ctrl>` + `b` to `<Ctrl>` + `<Space>`

#### You can check mapped commands in `~/.tmux.conf` file

#### Other commands are same with Tmux default commands (see [Tmux](https://github.com/tmux/tmux) references or run `$ tmux list-keys`)

<br/>

- `<Ctrl>` + `<Space>` + `<Opt>` + `h`/`j`/`k`/`l`: Resize size of Pane (can be repeated within 3 seconds after push `<Opt>`)
- `<Ctrl>` + `<Space>` + `<Opt>` + `s`: Align panes by horizon
- `<Ctrl>` + `<Space>` + `<Opt>` + `v`: Align panes by vertical
- `<Ctrl>` + `<Space>` + `<Space>`: Enter Copy mode (Vi mode)
- `<Ctrl>` + `<Space>` + `h`/`j`/`k`/`l`: Move cursor along panes
- `<Ctrl>` + `<Space>` + `p`: Paste characters or lines
- `<Ctrl>` + `<Space>` + `r`: Refresh `~/.tmux.conf`
- `<Ctrl>` + `<Space>` + `s`: Split panes by horizon
- `<Ctrl>` + `<Space>` + `v`: Split panes by vertical
- `<Ctrl>` + `<Space>` + `y`: Yank characters or lines in Copy mode
- `<Ctrl>` + `<Space>` + `[`/`]`: Move cursor along windows
