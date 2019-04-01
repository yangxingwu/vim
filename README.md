# vimrc backup

## setup Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Go

### show tags for Go

> From [vim-go](https://github.com/fatih/vim-go):
> `Tagbar` support to show tags of the source code in a sidebar with `gotags`

if you have already installed [vim-go](https://github.com/fatih/vim-go), run `:GoInstallBinaries` to
install `gotags` and other packages; and you can install `tagbar` from [majutsushi/tagbar](https://github.com/majutsushi/tagbar).

## nginx.conf

From [nginx](https://github.com/nginx/nginx/blob/release-1.11.10/contrib/README#L17):

> cp -R contrib/vim ~/.vim/

## Rust

To add rust support of YouCompleteMe:  

1. install rust source code `rustup component add rust-src`
2. build YouCompleteMe with `--rust-completer` flag

## [iterm2-solarized.md](https://gist.github.com/kevin-smets/8568070)

## restoring iTerm2 to default values

```bash
~$ defaults delete com.googlecode.iterm2
```
