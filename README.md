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

### install [packer.nvim](https://github.com/wbthomason/packer.nvim)

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
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

### install [packer.nvim](https://github.com/wbthomason/packer.nvim)

```cmd
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

> Note: If using `git bash` it is probably worth setting the home to the bash home directory instead of local app data.

## configuration

### Clone this repo in to the home configuration directory

```shell
git clone https://github.com/tiger-chan/nvim.git ~/.config/nvim
```

### Downloading packages

```shell
cd ~/.config/nvim
nvim .
```

Navigate to `lua/tiger-chan/packer.lua` then run `:so` followed by `:PackerSync`


