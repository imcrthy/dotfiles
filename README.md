# dotfiles

https://github.com/andsens/homeshick

```sh
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
$HOME/.homesick/repos/homeshick/bin/homeshick clone bf4/dotfiles
source $HOME/.bashrc # needed to get source homeshick path
homeshick cd dotfiles &&
  env WORKSTATION_UPDATE=true ./workstation
cd -
```
