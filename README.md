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
sudo apt install -y fd-find ripgrep luarocks python3-pip pipx python3-testresources chafa
snap install goimports-reviser
```

Mac OS:

```
brew install fd ripgrep luarocks python3 pipx tidy-html5 bufbuild/buf/buf chafa
brew tap incu6us/homebrew-tap
brew install incu6us/homebrew-tap/goimports-reviser
```

Arch Linux:

```
sudo pacman -S fd ripgrep luarocks python python-pip python-pipx ttf-dejavu chafa
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
for pkg in yamllint proselint codespell mdformat beautysh; do pipx install $pkg; done
```

Add to your `$PATH` env:

```
# Python paths
export PATH="$HOME/.local/bin:$PATH"
```

Laravel:

Follow the instructions at: https://github.com/barryvdh/laravel-ide-helper
