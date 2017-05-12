# What Was Installed: A Quick Guide

## Community Aliases

Read here: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases

A few helpful aliases added:

    $ l     # list files
    $ lr    # list files by last used
    $ ldot  # list dotfiles
    $ rm    # will now prompt to make sure you really want to delete.

## Git Helpers

Read here: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git

A few helpful aliases added:

    # Use "g" instead of git
    $ g status
    $ g log

    # Aliases I tend to use
    $ glo  # git log
    $ gb   # git branch
    $ gco  # git checkout
    $ gca  # git commit -a
    $ gc!  # git commit --amend
    $ gl   # git pull
    $ gp   # git push
    $ gd   # git diff
    $ gm   # git merge
    $ glgg # git log with graph!

## Extract

Read here: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/extract

Adds a helper to extract archives of any type without needing to know the underlying commands:

    $ extract foo.zip
    $ extract foo.tar.gz

# Z

Read here: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z

Adds a replacement for manually using cd to find directories.

- First build up a list by cd'ing to a bunch of places you normally go to (project dirs, etc).
- At this point you can `z <part of a directory name>` to jump to the most frequently/recently accessed
directory that fuzzy matches your search terms.

# zsh-autosuggestions

Will add suggestions for your prior-run shell commands as you type. Press right arrow to accept.

# zsh-syntax-highlighting

Shows invalid commands as red, valid as green, as you type.

# Pure

My personal fork of the Pure theme.

Simple theme that shows your working directory and git branch/repo information directly above.

My modification only removes the `git/` prefix that was before the branch name, so now you can double click
and copy the branch name easily.
