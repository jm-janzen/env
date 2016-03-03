autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile
unsetopt beep

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

bindkey -v # vim mode settings

autoload -U colors && colors

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

VIM_NORM="%{$fg[white]%} -- NORMAL -- %{$reset_color%}"
VIM_INST="%{$bg[red]%} -- INSERT -- %{$reset_color%}"

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/$VIM_NORM}/(main|viins)/$VIM_INST}"
    RPS2=$RPS1
    zle reset-prompt
}

function zle-line-finish {
}
zle -N zle-line-finish
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

setopt transient_rprompt
PS1="%(1j.[%j]"$'\n'".)%{$fg[magenta]%}%/ %{$fg_bold[magenta]%}>%{$reset_color%} "
#PS1="[$(jobs -p $$ | wc -l)]%{$fg[magenta]%}%/ %{$fg_bold[magenta]%}>%{$reset_color%} "
RPROMPT="${VIM_INST}"

### convenience
alias    ls='ls -l -p'
alias    ll='ls -a'
alias     l='\ls -p'
alias     j='jobs -l'
alias     h='history'
alias     t='tree -C'

alias ports='sudo netstat -uplant'        # list all TCP/UDP ports on the server
alias    df='df -H'                       # report file system disk space usage
alias    du='du -ch --summarize'          # print estimated disk usage
alias    mv='mv -i'                       # prompts for safety
alias    rm='rm -I'                       # "
alias    cp='cp -i'                       # "
alias    ln='ln -i'                       # "

function grade() {
    print "scale=2; $1 / $2 * 100" | bc
}

### scripts 
alias f='~/.myscripts/superfind.sh'   # Usage: f  <dir> <filename>
alias fr='~/.myscripts/repofind.sh'   # Usage: f  <dir> <reponame>
alias r='~/.myscripts/superrm.sh'     # Usage: rm <dir> (with tree output + prompt)
alias s='~/.myscripts/supergrep.sh'   # Usage: s  <dir> <pattern>

###################
### git aliases ###
###################
alias   g='git'                     #
alias  st='git status -s -b'        #shortform git status + branch info
alias  gs='git status'              #
alias  gd='git diff'                #
alias gdd="git diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'" #show character substitutions on the same line (and avert wordsalad)
alias gds='git diff --shortstat'   # just the stats, ma'am
alias gsl='git stash list --date=local' #
alias  gt='git log --graph --oneline --decorate --all' #
alias  "g?"='git remote -v update'    #fetch updates from all branches no set to skipDefaultUpdate (show ahead or behind)
alias  gf='git log -p --follow --oneline --' #
alias gfp='git log -p --follow --'  #
alias  gg='git grep'                #

alias  gp='git pull'              #
alias gpu='git push'              #
alias  ga='git add'               #
alias  gc='git checkout'          # shortcuts
alias gcm='git commit'            #
alias  gl='git log'               #
alias glp='git log -p'            #
alias  gb='git blame -c'          ### TODO add more parms for better readout

