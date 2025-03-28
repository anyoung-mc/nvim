# Neovim Configuration

# Prerequisite

## WSL2 Ubuntu

### Install [neovim](https://github.com/neovim/neovim)

```shell
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

### install [ripgrep](https://github.com/BurntSushi/ripgrep).

```shell
sudo apt install ripgrep
```

### install [Deno](https://docs.deno.com/runtime/getting_started/installation/) 
```shell
cargo install deno --locked
```

## Windows

### Install [neovim](https://github.com/neovim/neovim)

```cmd
winget install Neovim.Neovim
```

### install [ripgrep](https://github.com/BurntSushi/ripgrep).

```cmd
winget install BurntSushi.ripgrep.MSVC
```

### install [Deno](https://docs.deno.com/runtime/getting_started/installation/) 
```shell
cargo install deno --locked
```

> Note: If using `git bash` it is probably worth setting the home to the bash home directory instead of local app data. `export XDG_CONFIG_HOME="$HOME/.config`

## Configuration

### Clone this repo into the home configuration directory

```shell
git clone https://github.com/tiger-chan/nvim.git ~/.config/nvim
```

### Downloading packages

```shell
cd ~/.config/nvim
nvim .
```


