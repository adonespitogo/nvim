# Installation:

```
git clone git@github.com:adonespitogo/nvim.git ~/.config/nvim
```

## Fonts

Downloads [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases).

For Mac OS, copy the font files to `~/Library/Fonts/`.

For Linux, copy the font files to `~/.local/share/fonts`.

Fix missing loading icons in Gnome:

```sh
paru -S gnome-characters
```

## Packages

Debian:

```sh
sudo apt install -y fd-find ripgrep ranger python3-pip pipx python3-testresources chafa \
    universal-ctags rustup gotags luajit
cargo install typos-cli
```

Mac OS:

```sh
brew install fd ripgrep ranger python3 pipx tidy-html5 bufbuild/buf/buf chafa ctags \
    gotags bash-language-server rust typos-lsp typos-cli beautysh pgformatter luajit
```

Arch Linux:

```sh
paru -S fd ripgrep ranger python python-pip python-pipx ttf-dejavu chafa ctags gotags \
    bash-language-server buf rust typos beautysh pgformatter stylua unzip rsync luajit
```

## Install default packages via `asdf`:

Ruby gems:

File: `~/.default-gems`
```
ruby-lsp
erb_lint
haml_lint
htmlbeautifier
rubocop
rubocop-minitest
rubocop-packaging
rubocop-performance
rubocop-rails
solargraph
cocoapods
```

Go packages:

File: `~/.default-golang-pkgs`
```sh
github.com/google/yamlfmt/cmd/yamlfmt@latest
github.com/go-delve/delve/cmd/dlv@latest
```

Nodejs modules:

File: `~/.default-npm-packages`
```
eslint
eslint_d
eslint-config-es3
standard
fixjson
nginxbeautifier
prettier
@johnnymorganz/stylua-bin
vscode-langservers-extracted
@prantlf/jsonlint
@tailwindcss/language-server
typescript-language-server
typescript
blade-formatter
@olrtg/emmet-language-server
git+https://github.com/ramitos/jsctags.git
```

Pip modules:

File: `~/.default-python-packages`
```
yamllint
yamlfix
proselint
codespell
mdformat
beautysh
sqlfluff
```

Add to your `$PATH` env:

```sh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
```

Laravel:

Follow the instructions at: https://github.com/barryvdh/laravel-ide-helper

For `dlv` to work:

```sh
echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope
```

Protobufs:

```sh
cargo install --git https://git.sr.ht/~rrc/pbls
```
