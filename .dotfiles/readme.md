# Getting started

If you're starting from scratch, go ahead and:

create a .dotfiles folder, which we'll use to track your dotfiles:

```shell
git init --bare $HOME/.dotfiles
```

create an alias `dotfiles` so you don't need to type it all over again:

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

set git status to hide untracked files:

```shell
dotfiles config --local status.showUntrackedFiles no
```

add the alias to .bashrc (or .zshrc) so you can use it later:

```shell
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Now you can use regular git commands

```shell
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

## Setup environment in a new computer

clone your github repository:

```shell
git clone --bare https://github.com/donfreiday/dotfiles.git $HOME/.dotfiles
```

define the alias in the current shell scope:

```shell
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

checkout the actual content from the git repository to your `$HOME`:

```shell
dotfiles checkout
```

Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.

Source: <https://news.ycombinator.com/item?id=11070797>
