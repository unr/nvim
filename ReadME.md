# UNR's Dark Powered Neovim Configs

Heavily inspired by [vim-config](https://github.com/rafi/vim-config) and [SpaceVim](https://spacevim.org).

Written from the ground up by myself.


## Basic Install.

1. *Install Neovim*. I prefer to use homebrew, other options [available here](https://github.com/neovim/neovim/wiki/Installing-Neovim);

`brew install neovim/neovim/neovim`

Need to be sure that this has Python support - required for dark-powered plugins.

2. *Install Shougu/dein*. The key dark-powered element of our setup. Below are the install instructions [based on the official docs](https://github.com/Shougo/dein.vim/).

```bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
```

3. *Install unr/vim*. My dotfiles, using neovim + dein as installed above.

```bash
git clone git@github.com:unr/nvim.git ~/.config
```

Once this is done, you can run `nvim` and should see errors related to needing to install plugins. To complete setting up, launch nvim and run:

```bash
:call dein#install()

# or to recache/remove a plugin after editing
:call dein#recache_runtimepath()
```

4. You should be installed, and good to go by just running `nvim`. Let me know if you have issues.

## TODO

- [x] Upload basics to github
- [ ] Actually be satisfied with autocomplete/tern
- [ ] Proper support for less/PHP (mostly focused on Js/Vue right now)
- [ ] Write out MappingGuide, in actual vimrc (for mapping display in vim)
- [ ] Write out proper commands list in Readme. (table of <leader> func, etc)
- [ ] Proper install guide (install neovim w/ python, setup dein, install these dotfiles, run build)
- [ ] Improve PHP support (more augroup fixes, w/e the fuck is wrong with deocomplete)