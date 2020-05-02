# Aamnah's oh-my-zsh

This repo contains my `custom` folder for _oh-my-zsh_. Mainly, i have the `amnastic` custom theme and a bunch of aliases

### install

```bash
cd
git clone git@github.com:aamnah/oh-my-zsh-custom.git
mv oh-my-zsh-custom .oh-my-zsh-custom

# TODO: if ~/.zshrc exists, create a backup of it and then move file from this repo to it's place
# rm -rf ~/.zshrc
ln -s ${HOME}/.oh-my-zsh-custom/.zshrc ${HOME}/.zshrc
```

### .zshrc

the `~/.zshrc` is a symbolic link out of this repo

```bash
# delete the .zshrc in home
# and then create a symlink for the .zshrc inside of this repo to the home folder
ln -s ~/.oh-my-zsh-custom/.zshrc ~/.zshrc
```

i had to create the symbolic link because i wanted to commit the `.zshrc` file as well, which has my settings for theme `ZSH_THEME` and customization folder `ZSH_CUSTOM`

If you don't wanna do that, you can manually update these values

```bash
ZSH_THEME="amnastic"
ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom"
```

![screenshot amnastic.zsh-theme](https://github.com/aamnah/oh-my-zsh-custom/blob/master/amnastic.zsh-theme.png?raw=true)
