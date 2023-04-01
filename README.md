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
sudo apt install -y fd-find ripgrep luarocks python3-pip python3-testresources
snap install goimports-reviser
```

Mac OS:

```
brew install fd ripgrep luarocks python3 tidy-html5 bufbuild/buf/buf
brew tap incu6us/homebrew-tap
brew install incu6us/homebrew-tap/goimports-reviser
```

## Vim Plugins

Install `vim-plug` to install legacy vim plugins like `vim-surround`.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
  nvim +PlugInstall
```

## LSPs

Install [rustup](https://www.rust-lang.org/tools/install) then add this to your shell:

```
# Rust setup -------------------
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
source $HOME/.cargo/env
if [ ! -f "$HOME/.config/rustlang/autocomplete/rustup" ]; then
  mkdir -p ~/.config/rustlang/autocomplete
  rustup completions bash rustup >> ~/.config/rustlang/autocomplete/rustup
fi
source "$HOME/.config/rustlang/autocomplete/rustup"
if ! command -v rust-analyzer &> /dev/null
then
  echo "Installing rust-analyzer..."
  brew install rust-analyzer
  # Or sudo pacman -S rust-analyzer
  # Or sudo apt install -y rust-analyzer
fi
if ! cargo audit --version &> /dev/null; then
  cargo install cargo-audit --features=fix
fi
if ! cargo nextest --version &> /dev/null; then
  cargo install cargo-nextest
fi
if ! cargo fmt --version &> /dev/null; then
  rustup component add rustfmt
fi
if ! cargo clippy --version &> /dev/null; then
  rustup component add clippy
fi
if ! ls ~/.cargo/bin | grep 'cargo-upgrade' &> /dev/null; then
  cargo install cargo-edit
fi
```

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
    @tailwindcss/language-server
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
```

Sql LSP:

```
ln -s ~/.config/nvim/sql-language-server ~/.config/sql-language-server
```
