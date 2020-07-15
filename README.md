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



aliases.zsh
---
Shortcuts for directories, programs, system processes and commands.

#### Directories
- `desk` go to Desktop
- `dl` go to Downloads

#### Misc.
- `emptytrash` Empty the Trash on all mounted volumes and the main HDD
- `cleanup` Recursively delete _.DS_Store_ files
- `chromekill` Kill all the tabs in Chrome to free up memory
- `afk` Lock the screen (when going AFK)
- `reload` Reload the shell (i.e. invoke as a login shell)
- `tree` Always list the tree command in color coding

#### Smart Listings
- `ll` List all (-a) files and directories in a detailed (-l), human readable (-h), color coded (-G) way with a trailing slash (-F).
- `lsd` Only list directories, including hidden ones

#### Sudo
- `dang` repeat the last command with sudo, basically `sudo !!` equivalent

#### Disk Usage
- `ducks` List top ten largest files/directories in current directory
- `ds` Find the biggest in a folder

#### Memory
- `wotgobblemem` What's gobbling the memory?

#### DNS
- `flush`, `flushdns` Flush DNS cache
- `dig` Better and more to-the-point dig results

#### IPs
- `ip`, `myip` Show Public IP address
- `localip` Show local IP

#### Security
- `netlisteners` Show active network listeners


functions.zsh
---
- `take()` create a dir and cd to it by taking a name
- `fopen()` create a file and open it in Sublime Text
- `extract()` Extract most know archives with one command
- `ii()` display useful host related informaton
- `getwebsite()` wget a whole website
- `spy()` identify and search for active network connections
- `sniff()` sniff GET and POST traffic over http v2
- `bell()` Ring the system bell after finishing a script/compile
- `jpost` Create new Jekyll posts
