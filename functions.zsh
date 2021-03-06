# ~/$ZSH_CUSTOM/functions.zsh

# Author: Aamnah <hello@aamnah.com> @AamnahAkram
# Link: https://aamnah.com
# Version: 0.1
# lastmod: 2020-07-15

# some functions taken from Nate Landau's .bash_profile
# http://natelandau.com/my-mac-osx-bash_profile/

#   take:  create a dir and cd to it by taking an argument
#   ---------------------------------------------------------
take () {
mkdir -p "$@" && cd "$@"
}

#   fopen:  create a file and open it in Sublime Text
#   ---------------------------------------------------------
fopen () {
  touch $1
  code $1
}

#   extract:  Extract most known archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
          esac
      else
          echo "'$1' is not a valid file"
      fi
}

#   ii:  display useful host related information
#   (notes: color_codes need to be defined in .bash_profile
#   and $HOST needs to be defined)
#   -------------------------------------------------------------------

ii() {
    echo -e "\nYou are logged on ${Red} $HOST"
    echo -e "\nAdditional information:$Color_Off " ; uname -a
    echo -e "\n${color_blue}Users logged on:$color_off " ; w -h
    echo -e "\n${color_yellow}Current date :$color_off " ; date
    echo -e "\n${color_pink}Machine stats :$color_off " ; uptime
    echo -e "\n${color_cyan}Current network location :$color_off " ; scselect
    echo -e "\n${color_green}Public facing IP Address :$color_off " ;myip
    #echo -e "\n${color_blue}DNS Configuration:$color_off " ; scutil --dns
    echo
}

#   authme: Copy public key to remote machine (dependency-less)
#   -------------------------------------------------------------------
function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_rsa.pub
}

#   getwebsite:  wget a whole website
# Download an entire website
# -p --page-requisites: get all the elements that compose the page (images, CSS and so on)
# -e robots=off you don't want wget to obey by the robots.txt file
# -U mozilla as your browsers identity.
# --random-wait to let wget chose a random number of seconds to wait, avoid get into black list.
# Other Useful wget Parameters:
# -k --convert-links: convert links so that they work locally, off-line.
# --limit-rate=20k limits the rate at which it downloads files.
# -b continues wget after logging out.
# -o $HOME/wget_log.txt logs the output
#   ---------------------------------------------------------
getwebsite () {
  wget --random-wait -r -p -e robots=off -U mozilla $1
}

#   getimages:  wget all images from a directory listing (e.g. wp-content)
#   ---------------------------------------------------------
getimages () {
  wget --random-wait -r -P . --accept=jpg,jpeg,gif,png -e robots=off  $1
}

# Save all images from a URL in the current directory
#   ---------------------------------------------------------
# -nd: no directories (save all files to the current directory; -P directory changes the target directory)
# -r -l 2: recursive level 2
# -A: accepted extensions
# -H: span hosts (wget doesn't download files from different domains or subdomains by default)
# -p: page requisites (includes resources like images on each page)
# -e robots=off: execute command robotos=off as if it was part of .wgetrc file. This turns off the robot exclusion which means you ignore robots.txt and the robot meta tags (you should know the implications this comes with, take care).
# -P sets the directory prefix where all files and directories are saved to.

wgetimg() {
  wget -nd -r -l 2 -P . -A jpeg,jpg,png $1
}

#   spy: identify and search for active network connections
#   ---------------------------------------------------------
spy () {
  lsof -i -P +c 0 +M | grep -i "$1"
}

#   sniff: GET and POST traffic over http v2
#   ---------------------------------------------------------
sniff () {
  sudo ngrep -d ${1} -t '^(GET|POST) ' 'tcp and port 80';
}

#   bell: Ring the system bell after finishing a long script/compile
# use 'xset b [vol [pitch [duration]]]' to get the bell to sound the way you want.
# eg: xset b 50 1700 10 (xset command doesn't work on Mac)
#   ---------------------------------------------------------
bell () {
  ${1} && echo -e '\a' || (echo -e '\a'; sleep 1; echo -e '\a')
}
