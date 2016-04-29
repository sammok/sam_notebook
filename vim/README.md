## How to use this .vimrc

- Copy .vimrc` file to directory `~/`, overlapping your original `.vimrc` file
- Setup [vundle](https://github.com/VundleVim/Vundle.vim)
    - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Into `$ vim` then `:PluginInstall`


## Some shortcut keys
- In normal model
    - `CTRL + N` toggle **Nerd_Tree**
    - `CTRL + P` toggle **CtrlP**
    - [Auto surround see this link](https://github.com/tpope/vim-surround)
    - Navigate between Nerd_tree and window `CTRL + W` then type `W`

- In insert model
    - Indentation `TAB`
    - Unindentation `SHIFT + TAB`
    - Copy and Past current line `CTRL + D`
    - Auto Complete `CTRL + N`(next autocomplete) and `CTRL + P`(previous autocomplete)

- In virtual model
    - Indentation `TAB`
    - Unindentation `SHIFT + TAB`

- In any model 
    - Type `F4` to compile your current focused program sorce file
        - Supported: `python`, `c`, `c++`, `ruby`
