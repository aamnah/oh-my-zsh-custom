# ~/.bash_profile 
# ~/$ZSH_CUSTOM/aliases.zsh

# Author: Aamnah <hello@aamnah.com> @AamnahAkram
# Link: https://aamnah.com
# Version: 0.4
# lastmod: 2021-02-26

# take a look at http://alias.sh/
# for some really cool aliases
# http://www.commandlinefu.com/commands/

# Detect the platform we're running on (Linux / macOS) with $OSTYPE so we can alter the commands accordingly

## DIRs
#----------------------------------------------------------
alias desk='cd ~/Desktop'
alias dl='cd ~/Downloads'

SITES_FOLDER='~/Sites'
PROJECTS_FOLDER='~/Projects'
TEMPORARY_FOLDER='~/tmp'

alias proj="cd ${PROJECTS_FOLDER}"
alias sites="cd ${SITES_FOLDER}"
alias tmp="cd ${TEMPORARY_FOLDER}"

# COMMANDS & TOOLS
#----------------------------------------------------------
alias ls='ls -hF'
# alias ll='ls -alhF --color' # -a for all, -l for detailed, -h for human readable, F for trailing /, --color for color coding
# -A List all entries except for . and ...  Always set for the super-user.
# -F Display indicators. a slash (`/') immediately after each pathname that is a directory,
            #  an asterisk (`*') after each that is executable, an at sign (`@') after
            #  each symbolic link, an equals sign (`=') after each socket, a percent sign
            #  (`%') after each whiteout, and a vertical bar (`|') after each that is a FIFO.
# Colorized output is -G on macOS and --color on Linux (Ubuntu)
# -h is for human readable, print sizes like 1K 234M 2.3G etc.

# use -G if macOS, --color if Linux (Ubuntu)
[[ $OSTYPE = darwin* ]] && alias ll='ls -AlFGh' || alias ll='ls -AlhF --color'
alias lsd='ls -GAl | grep ^d' # Only list directories, including hidden ones
alias l='ls -AFGhx' # -x for line based listing instead of columns. the multi-column output is produced with entries sorted across, rather than down, the columns

# Always list the tree command in color coding
alias tree='tree -C'

# grep --color=auto displays colored output unless output piped to a different command
# grep --color=always always colors output, even adding control sequences to other piped commands
# more: https://linuxcommando.blogspot.com/2007/10/grep-with-color-output.html
alias grep='grep --color=auto' 

# youtube-dl
alias ydl='youtube-dl'

# run ssh-agent and load SSH key
# SSH_KEY='/media/aamnah/Files/.ssh/foo'
# alias gath="eval $(ssh-agent) && ssh-add ${SSH_KEY}"


# MISC.
#----------------------------------------------------------
## IP addresses
alias myip='curl ifconfig.me'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

## Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

## Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

## Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

## Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

## Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# SUDO
alias dang='sudo $(history -p \!\!)'


## DISK USAGE
#----------------------------------------------------------
# List top ten largest files/directories in current directory
# alias ducks='du -cks *|sort -rn|head -11'
# du -cks : -c for grand total , -k for 1-Kbyte blocks, -s for displaying entries for each file
# sort -rn : -r for reverse order, -n for numeric sort
# head -11 : display first 11 lines
alias ducks='du -chs * | sort -rh | head -11' # same as above but human-readable

# Find the biggest in a folder
alias ds='du -ks *|sort -n'


## MEMORY
#----------------------------------------------------------
# What's gobbling the memory?
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'


## DNS
#----------------------------------------------------------
# Flush DNS cache
if [[ $OSTYPE == darwin* ]]; then
  # works on macOS
  alias flushdns='sudo dscacheutil -flushcache'
elif [[ $OSTYPE == linux* ]]; then
  # works on Ubuntu 18.04+
  alias flushdns='sudo systemd-resolve --flush-caches'
fi


## SECURITY
#----------------------------------------------------------
# Show active network listeners
alias netlisteners='lsof -i -P | grep LISTEN'

# spy() and sniff() have been added to .functions
