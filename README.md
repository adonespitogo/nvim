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
sudo apt install -y fd-find ripgrep ranger luarocks python3-pip pipx python3-testresources chafa universal-ctags
```

Mac OS:

```
brew install fd ripgrep ranger luarocks python3 pipx tidy-html5 bufbuild/buf/buf chafa ctags netcoredbg bash-language-server
```

Arch Linux:

```
yay -S fd ripgrep ranger luarocks python python-pip python-pipx ttf-dejavu chafa ctags netcoredbg bash-language-server
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
    typescript-language-server          \
    typescript                          \
    blade-formatter                     \
    git+https://github.com/ramitos/jsctags.git
```

Install pip modules:

```
for pkg in yamllint proselint codespell mdformat beautysh sqlfluff; do pipx install $pkg; done
```

Add to your `$PATH` env:

```
# Python paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
```

Laravel:

Follow the instructions at: https://github.com/barryvdh/laravel-ide-helper

GO:

```
go install github.com/go-delve/delve/cmd/dlv@latest
echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope
```
