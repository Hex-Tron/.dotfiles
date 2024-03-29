
  
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hextron/.oh-my-zsh"
export FZF_COMPLETION_TRIGGER='?'
bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion

#export PAGER="vim -R +AnsiEsc"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
## If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" 
# "adben" 
# "agnoster" 
# "amuse" 
# "blinks" 
# "darkblood" 
# "eastwood" 
# "fino" 
# "fox" 
# "intheloop" 
# "juanghurtado" 
# "kiwi" 
# "nicoulaj" 
# "af-magic"
#)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
clear

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



#/home/hextron/.cargo/bin:

export PATH=/var/lib/snapd/snap/bin:/home/hextron/.cargo/bin:/home/hextron/go/bin:/usr/lib/jackett:/home/hextron/.local/bin:$PATH
alias v='find . -type f -readable -not -path  "*/\.git*" | fzf -i --preview "~/.vim/plugged/fzf.vim/bin/preview.sh {} " --tac --bind "enter:execute(nvim {})"' # version new
# fzf --multi --bind 'ctrl-a:select-all+accept'

# alias v='find . -type f -readable -not -path  "*/\.git*" | fzf -i --preview "~/.vim/plugged/fzf.vim/bin/preview.sh {} " --tac --multi --bind "enter:execute(nvim {})" --bind "enter:kill-line"' #verion test
#alias c='cd $(z | awk -F ' ' '{print $2}' | fzf )' #version 1

#alias c="cd \$(z -gt | awk -F ' ' '{print \$2}' | fzf -i --preview 'exa -l {}'  --height=50%)" #version 2
#
#
#
#
#
#
#
#
#
# alias c="cd \$(z -gt | cut -b 12- | fzf -i --preview 'exa -l {}'  --height=50% --tac  --no-sort)"
# alias v="$show --bind 'enter:execute(nvim {})' " version 1
# source /home/hextron/go/src/github.com/tomnomnom/gf/gf-completion.bash
source /home/hextron/go/pkg/mod/github.com/tomnomnom/gf@v0.0.0-20200618134122-dcd4c361f9f5/gf-completion.zsh
alias gff='/home/hextron/go/bin/gf'
alias dirsearch='/home/hextron/Tools/dirsearch/dirsearch.py'
# eval "$(lua /home/hextron/.z.lua/z.lua --init zsh)"
# plugins=(z colored-man-pages)



#-----------------------------------------------------------------------------------
# pacman alias

alias psearch='pacman -Ss'

alias pinstall='sudo pacman -S'
alias premove='sudo pacman -R'
alias pupdate='sudo pacman -Syu'

#-----------------------------------------------------------------------------------

alias timer='/home/hextron/project/python/timer/main.py'

#-----------------------------------------------------------------------------------
alias cipher='python /home/hextron/project/python/cipher/src/main.py'

#-----------------------------------------------------------------------------------
alias paramspider='python /home/hextron/Tools/ParamSpider/paramspider.py'


#-----------------------------------------------------------------------------------
alias gau='/home/hextron/go/bin/gau'

#-----------------------------------------------------------------------------------
#bindkey
bindkey -s '^E' 'ranger^M'


#-----------------------------------------------------------------------------------
#copy command 

alias copy='xclip -selection clipboard'


#-----------------------------------------------------------------------------------
#v
#alias vh="vim \$(grep '^>' ~/.viminfo | awk -F ' ' '{print \$2}' | sed 's/~/\/home\/hextron/g' |fzf --height=40% -i --preview '~/.vim/plugged/fzf.vim/bin/preview.sh {}' )"   #verion 1

#alias vh="vim \$(grep '^>' ~/.viminfo | awk -F ' ' '{print \$2}' | sed 's/~/\$(echo HOME)g' |fzf)" version 2
# alias vh="grep '^>' ~/.viminfo | awk -F ' ' '{print \$2}' | sed 's/~/\/home\/hextron/g' |fzf --height=40% -i --no-sort --preview '~/.vim/plugged/fzf.vim/bin/preview.sh {}' --bind 'enter:execute(nvim {})'"

#-----------------------------------------------------------------------------------
#l
alias l="exa -la --sort=time"

source ~/go/bin/c_command.sh

# cp () {
# cp "$1" "$2"
# }

