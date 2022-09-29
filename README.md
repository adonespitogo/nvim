# Installation:

## Terminal
For Mac OS, install `Iterm2` terminal imulator.

## Fonts
Downloads [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases). Double click each font file to install.

## Packages
Install `fd` and `ripgrep` package:

Debian:
```
sudo apt install -y fd-find ripgrep python3-proselint
```

Mac OS:
```
brew install fd ripgrep
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
    eslint \                                # for typescript/javascript, add .eslintrc.json to your project
    stylelint stylelint-config-standard \   # for css/scss, make sure to add .stylelintrc.json to your project
    vscode-langservers-extracted \          # for html
    @prantlf/jsonlint
```


