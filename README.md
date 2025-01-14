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
sudo apt install -y fd-find ripgrep ranger python3-pip pipx python3-testresources chafa universal-ctags rustup gotags
cargo install typos-cli
```

```sh
# cargo
export PATH="/home/adonesp/.cargo/bin:$PATH"
```

Mac OS:

```sh
brew install fd ripgrep ranger python3 pipx tidy-html5 bufbuild/buf/buf chafa ctags gotags netcoredbg bash-language-server rust typos beautysh pgformatter
```

Arch Linux:

```sh
paru -S fd ripgrep ranger python python-pip python-pipx ttf-dejavu chafa ctags gotags netcoredbg bash-language-server buf rust typos beautysh pgformatter stylua unzip rsync
```

## LSPs

Install ruby gems:

```sh
gem install \
    ruby-lsp \
    erb_lint \
    haml_lint \
    htmlbeautifier \
    rubocop \
    rubocop-minitest \
    rubocop-packaging \
    rubocop-performance \
    rubocop-rails \
    solargraph \
```

Install go modules:

```sh
go install github.com/google/yamlfmt/cmd/yamlfmt@latest && \
    mkdir -p ~/.local/bin && \
    mv $(which yamlfmt) ~/.local/bin
```

Install npm modules:

You can add these node packages to `$NVM_DIR/default-packages` if you're using [NVM](https://github.com/nvm-sh/nvm), otherwise install with `npm install`:

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

Install pip modules:

```sh
for pkg in yamllint yamlfix proselint codespell mdformat beautysh sqlfluff; do pip install $pkg; done
```

Add to your `$PATH` env:

```sh
# Python paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
```

Laravel:

Follow the instructions at: https://github.com/barryvdh/laravel-ide-helper

GO:

```sh
go install github.com/go-delve/delve/cmd/dlv@latest
echo "0"|sudo tee /proc/sys/kernel/yama/ptrace_scope
```

Protobufs:

```sh
cargo install --git https://git.sr.ht/~rrc/pbls
```
