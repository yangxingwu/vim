# vimrc backup

## 1.Go

### 1.1.show tags for Go

> From [vim-go](https://github.com/fatih/vim-go):
> `Tagbar` support to show tags of the source code in a sidebar with `gotags`

if you have already installed [vim-go](https://github.com/fatih/vim-go), run `:GoInstallBinaries` to
install `gotags` and other packages; and you can install `tagbar` from [majutsushi/tagbar](https://github.com/majutsushi/tagbar).

## 2.nginx.conf

From [nginx](https://github.com/nginx/nginx/blob/release-1.11.10/contrib/README#L17):

> cp -R contrib/vim ~/.vim/

## 3.Rust

To add rust support of YouCompleteMe:  

1. install rust source code `rustup component add rust-src`
2. build YouCompleteMe with `--rust-completer` flag

## 4.[iterm2-solarized.md](https://gist.github.com/kevin-smets/8568070)

## 5.restoring iTerm2 to default values

```bash
~$ defaults delete com.googlecode.iterm2
```

## 6.neovim

- default config path: `~/.config/nvim/init.vim`
- default plugin path: `~/.local/share/nvim/plugged`

## 7.[ctags](https://github.com/universal-ctags/ctags)

```bash
$ git clone git@github.com:universal-ctags/ctags.git
$ cd ctags
$ ./autogen.sh
$ ./configure --prefix=/where/you/want # defaults to /usr/local
$ make
$ make install # may require extra privileges depending on where to install
```

## 8.python linter

```bash
$ pip install pylint
```

## 9.YouCompleteMe with bear

### 9.1.install bear

```bash
$ git@github.com:rizsotto/Bear.git
$ cd Bear
$ cmake .
$ make all
$ sudo make install
```

### 9.2.generate JSON compilation database

```bash
$ bear <your-build-command>
```

## 10.shellcheck

```bash
$ sudo yum install cabal-install
$ cd shellcheck
$ cabal install
$ export PATH="$HOME/.cabal/bin:$PATH"
```
