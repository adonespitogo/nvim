# Installation:

```
git clone git@github.com:adonespitogo/nvim.git ~/.config/nvim
```

## Fonts

Downloads [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases).

For Mac OS, copy the font files to `~/Library/Fonts/`.

For Linux, copy the font files to `~/.local/share/fonts`.

## Packages

Debian:

```
sudo apt install -y fd-find ripgrep luarocks python3-pip python3-testresources chafa
snap install goimports-reviser
```

Mac OS:

```
brew install fd ripgrep luarocks python3 tidy-html5 bufbuild/buf/buf chafa
brew tap incu6us/homebrew-tap
brew install incu6us/homebrew-tap/goimports-reviser
```

Arch Linux:

```
sudo pacman -S fd ripgrep luarocks python python-pip ttf-dejavu chafa
```

## Vim Plugins

Install `vim-plug` to install legacy vim plugins like `vim-surround`.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
  nvim +PlugInstall
```

## LSPs

Install luarocks:

```
luarocks install luacheck --local
luarocks install jsregexp --local
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
    eslint_d                            \
    eslint-config-es3                   \
    fixjson                             \
    nginxbeautifier                     \
    prettier                            \
    @johnnymorganz/stylua-bin           \
    vscode-langservers-extracted        \
    @prantlf/jsonlint                   \
    @tailwindcss/language-server        \
    blade-formatter
```

Install pip modules:

```
pip install --user yamllint proselint codespell mdformat beautysh
```

Add to your `$PATH` env:

```
# Python paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.10/bin"

# php formatter
export PATH="$PATH:$HOME/.config/nvim/tools/php-cs-fixer/vendor/bin"
```

Laravel:

Follow the instructions at: https://github.com/barryvdh/laravel-ide-helper
