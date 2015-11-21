# Add git, node and homebrew /bin's to PATH.
export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/git/bin:/usr/bin:$PATH


#Sets SVN, GVS and default editors to vim
 export EDITOR="vim"
 export CVSEDITOR="vim"
 export SVN_EDITOR="vim"

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Alias for wget
alias wget="curl -O"

# Start SQL
alias smysql="/usr/local/bin/mysql.server start"

# Include my own git parse type function
source ~/.git_status_in_prompt.sh

#Sets the shell prompt to "DIRECTORY [- GIT_BARNCH]\n→"
export PS1='\[\033[36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; then \
echo "\[\033[34m\]- $(gitParseStatus)\[\033[33m\]$(git branch | grep ^*|sed s/\*\ //)"; fi)\[\033[32m\]\nremote→ \[\033[00m\]'

export CLICOLOR=1
export LSCOLORS=dxfxcxcxbxexexbxbxDADA
# See http://softwaregravy.wordpress.com/2010/10/16/ls-colors-for-mac/

# More Git aliases
alias git='hub'
alias g='git'
alias gst='git status -s'
alias gpull='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -a -m'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --oneline --decorate'
alias glogg='git log --oneline --decorate --graph'
alias glogs='git log --oneline --decorate --stat'
alias gcl='git clone'
alias gdc='git difftool --cached'

#Aliases for ls
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lh'
alias l='ls $LS_OPTIONS -lhA'
alias lsa='ls -a $LS_OPTIONS'

alias rm='rm -i'

#Apache commands
alias apaches='sudo apachectl start'
alias apacher='sudo apachectl restart'
alias apachestop='sudo apachectl stop'

alias c='clear'

###########
# From: https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile
###########

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"

# To make Postgres work with Canvas
export PGHOST=localhost
