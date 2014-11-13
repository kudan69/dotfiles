# dotfiles

## intro

Based off of Zach Holman's dotfiles

The following will be installed amoung others:
```sh
zsh
macvim
ruby
rails
git
homebrew
rbenv
tmux
```


## install

Before you install, customize the following files to your needs:
```sh
For the ruby versions
*/script/rbenv
For git configs
*/git/gitconfig.symlink
```

Run this:

```sh
git clone https://github.com/kudan69/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake #to install apps/plugins, do symlinking, and setup vim plugins

For selective installs
rake install_plugins #to install just apps/plugins
rake install_symlinks #to just do the symlinking
rake install_vundle #to just install vim plugins
rake install_configs #to hook up config files for certain apps
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

You'll also want to change `git/gitconfig.symlink`, which will set you up as
committing as me. You probably don't want that.

## uninstall

Run this:

```sh
cd ~/.dotfiles
rake uninstall #to uninstall apps/plugins/cached files from apps and do take away symlinking
rake uninstall_plugins #to uninstall just apps/plugins/cached files
rake uninstall_symlinks #to just undo the symlinking
```

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.

## add-ons

There are a few things I use to make my life awesome. They're not a required
dependency, but if you install them they'll make your life a bit more like a
bubble bath.

- If you install the excellent [rbenv](https://github.com/sstephenson/rbenv) to
  manage multiple rubies, your current branch will show up in the prompt. Bonus.

