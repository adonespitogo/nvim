# Installation:

## Terminal
For Mac OS, install `Iterm2` terminal imulator.

## Fonts
Downloads [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases). Double click each font file to install.

## Packages

Debian:
```
sudo apt install -y fd-find ripgrep python3-proselint lua-check
```

Mac OS:
```
brew install fd ripgrep luarorocks
luarorocks install luacheck
```

## LSPs

Install ruby gems:
```
gem install     \
    solargraph  \
    erb_lint    \
    haml_lint
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
pip install --user yamllint
```
