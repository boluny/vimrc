vimrc
=====

My personal config file for vim(with vundle)

*Switched to vim-plug based plugin manager as Vundle is not developed for 2 years*

Steps to follow:
1. `curl -x socks5h://127.0.0.1:1080 -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
2. Clone this repo and copy .vimrc to user directory:
`git clone https://github.com/boluny/vimrc.git && cp ./vimrc/.vimrc ~`
3. Start vim and run command: `PlugUpgrade && PlugInstall`

Plugin list can be found on site [vim awesome][]


Reference:
* [vim-plug](https://github.com/junegunn/vim-plug)
* [vim awesome][]
* [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
* [vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)

=====

[vim awesome]: https://vimawesome.com "Vim Awesome"
