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

## System dependencies

Ubuntu/Debian:

Install [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) first.

```sh
sudo apt install -y tree-sitter-cli fd-find ripgrep ranger python3-pip pipx python3-testresources chafa \
    universal-ctags rustup gotags luajit luacheck
cargo install typos-cli
```

Mac OS:

```sh
brew install neovim tree-sitter-cli fd ripgrep ranger python3 pipx tidy-html5 bufbuild/buf/buf chafa ctags \
    gotags bash-language-server rust typos-lsp typos-cli beautysh pgformatter luajit luacheck
```

Arch Linux:

```sh
paru -S neovim tree-sitter tree-sitter-cli fd ripgrep ranger python python-pip python-pipx ttf-dejavu chafa ctags gotags \
    bash-language-server buf rust typos beautysh pgformatter stylua unzip rsync luajit luacheck
```

## Default packages

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

File: `~/.default-golang-pkgs`
```sh
github.com/google/yamlfmt/cmd/yamlfmt@latest
github.com/go-delve/delve/cmd/dlv@latest
github.com/a-h/templ/cmd/templ@v0.2.793
github.com/hashicorp/terraform@v1.5.7
```

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
@taplo/cli
@adonesp/snapbackjs
```

File: `~/.default-python-packages`
```
yamllint
yamlfix
proselint
codespell
mdformat
beautysh
sqlfluff
shandy-sqlfmt[jinjafmt]
```

Then install [asdf](https://asdf-vm.com) multi-language version manager.

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
