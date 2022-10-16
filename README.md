# Installation:

## Fonts
Downloads [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases).

For Mac OS, copy the font files to `~/Library/Fonts/`.

For Linux, copy the font files to `~/.local/share/fonts`.

## Packages

Debian:
```
sudo apt install -y fd-find ripgrep luarocks python3-pip
```

Mac OS:
```
brew install fd ripgrep luarocks python3
```

## Vim Plugins

Install `vim-plug` to install legacy vim plugins like `vim-surround`.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall
```

## LSPs

Install luarocks:
```
luarocks install luacheck
```

Install ruby gems:
```
gem install     \
    solargraph  \
    erb_lint    \
    haml_lint   \
    rubocop     \
    rubocop-minitest    \
    rubocop-packaging   \
    rubocop-performance \
    rubocop-rails
```
Run in ruby project root:
```
solargraph bundle
```
NOTE: When installing solargraph, make sure default ruby version and your project's ruby version is the same: `rmv --default use [ruby version]`

Install npm modules:
```
npm i -g \
    eslint                              \
    @johnnymorganz/stylua-bin           \
    stylelint stylelint-config-standard \
    vscode-langservers-extracted        \
    @prantlf/jsonlint                   \
    @fsouza/prettierd                   \
    @tailwindcss/language-server
```

Install pip modules:
```
pip install --user yamllint proselint
```
