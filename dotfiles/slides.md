# The Ultimate Dotfile Setup

An opinionated presentation by [@colinfdrake](https://twitter.com/colinfdrake)

---

# First: Why Spend the Time?

- Work more effectively
	- Reduce common commands to short aliases
	- Set up shell keybindings you're quick with (vi, emacs)
	- Leverage community maintained plugins with this system
- Able able to switch to dotfiles on new systems in seconds
	- Have configurations at your fingertips on remote systems
	- Alternate between coworker configs while pairing!

---

# Basic Recommendations

- A *Github repository*, for easy access
- *GNU Stow* for portable and flexible file management
- *ZSH*, for the massive plugin community

---

# Other Recommendations

Plugins, utilities, etc:

- `z`, `ag`, `rlwrap`, `trash`
- `extract`, `common-aliases`, `git`, `osx`
- `zsh-autosuggestions`, `zsh-syntax-highlighting`

---

# Managing Your Dotfiles: Git and GNU Stow

---

# Create the Repository

Personally, I like to store mine at `~/.dotfiles`.

```bash
$ cd ~
$ mkdir .dotfiles
$ cd .dotfiles
$ git init .
```

---

# Installing Stow

```bash
$ brew install stow
```

---

# Directory Structure

Human-readable, organizable "buckets" with the real, underlying structure beneath:

```text
~/.dotfiles/
  git/
    .gitconfig
    .config/
      hub
  nvim/
    .config/
      nvim/
        init.vim
  zsh/
    .zshrc
```

---

# Running Stow

Given the previous directory structure, this:

```bash
$ stow --target=$HOME {git,nvim,zsh}
```

will create symlinks at:

```bash
$HOME/
  .gitconfig
  config/
    hub
    nvim/
      init.vim
  .zshrc
```

---

# Advantages

- Separates out configuration files nicely for editing
- Installable _and reversible_ in one command
	- Can work in piecemeal fashion or in full
- Manageable in a git repository separate from `$HOME`
- Easily switch between work, server-specific, personal, ... configs

---

# ZSH: Upgrading Your Shell

---

# zsh

Many advanced differences, but for day to day work:

- Almost fully `bash` compatible, unlike [fish](https://fishshell.com/)
- Smarter tab completions
	- Case insensitivity for files
	- Try `cd /u/l/b<TAB>`
    - Custom completion hooks: subcommands for `git`, etc.
- Shared history buffer with _all_ open sessions
- But really... _access to the largest shell plugin ecosystem_

---

### Use `zsh` for interactive shell, `bash` for portable scripting.

---

# zplug

- ZSH plugin manager
- Smaller/quicker than `oh-my-zsh`, but uses same plugin repo
	- And more! ex: I have a [forked Pure theme](https://gist.github.com/cfdrake/e88e2984f1d59fc05f3cdc66573d78be) stored in a Gist.
- Minimal boilerplate to auto update and plugins, etc.

---

# Installing zsh and zplug

```bash
$ brew install zsh zplug
```

---

# Setup Walkthrough
