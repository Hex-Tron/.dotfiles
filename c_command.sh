#!/bin/bash

# ---------------------------------------------------------------------------------------------------
function c() {
  argument=$1
  file__=`cat ~/.z | cut -d '|' -f 1 `
  cd "$(printf "%s\n" "$file__" | fzf -q "$argument" -i --preview 'exa -l {}' --height=50% --tac )"
}

# ---------------------------------------------------------------------------------------------------
function vh() {

  argument=$1
  grep '^>' ~/.viminfo | awk -F ' ' "{print $2}" | sed 's/~/\/home\/hextron/g' | cut --complement -b -2 |fzf -q "$argument" --height=40% -i --no-sort --preview '~/.vim/plugged/fzf.vim/bin/preview.sh {}'  --bind 'enter:execute(nvim {})'
}

# ---------------------------------------------------------------------------------------------------

function nv() {
  argument=$1
  nvim "$argument"
  echo "> $PWD/$argument" >>/home/hextron/.files
}


# ---------------------------------------------------------------------------------------------------

_copy_comp ()
{
  BRANCH_REGEX="^(-)"
  New_R='^$'
  local curr_arg prev_arg
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  prev_arg=${COMP_WORDS[COMP_CWORD-1]}
  local current_word=$2

  if [[ $prev_arg =~ $BRANCH_REGEX ]];
  then 
    COMPREPLY=( $( /bin/ls -1 | fzf --reverse ) )
    return 0
  else 
    COMPREPLY=( $(compgen -W "$(ls -a )" -- "$current_word") )

  fi



  if [[ -e $prev_arg ]] || [[ -d $prev_arg ]];
  then
    COMPREPLY=( $( cat /home/hextron/.z | cut -d '|' -f 1  | fzf --reverse ) )
    return 0
  fi

  if [[  $curr_arg =~ $New_R ]];
  then 
    COMPREPLY=( $( ls -a | fzf --reverse ) )
  fi

}
complete  -o filenames -F _copy_comp fcp

function fcp() {

  cp "$@"
} # ---------------------------------------------------------------------------------------------------

function ff() {

  if [[ $# -gt 0 ]]; then 
    local var=$1
    local block=$(fd -t f . "$var" | fzf -i --bind "tab:reload(fd -t d . $var )")
    echo -e "'$block'" | xclip -selection clipboard
    return 
  fi



  if [[ ! -d $HOME/.cache/ff ]]; then 
    mkdir $HOME/.cache/ff
    touch $HOME/.cache/ff/filenames.txt
    $HOME/.cargo/bin/fd -t f . "$HOME" > $HOME/.cache/ff/filenames.txt
    $HOME/.cargo/bin/fd -t d . "$HOME" > $HOME/.cache/ff/dirnames.txt


  fi

  local var1=$( cat $HOME/.cache/ff/filenames.txt | fzf -i --bind 'tab:reload(cat "$HOME/.cache/ff/dirnames.txt")')
  if [ ! -z $var1 ]
  then 
    echo -e "'$var1'" | xclip -selection clipboard
  else
    $HOME/.cargo/bin/fd -t f . "$HOME" > $HOME/.cache/ff/filenames.txt
    $HOME/.cargo/bin/fd -t d . "$HOME" > $HOME/.cache/ff/dirnames.txt
  fi

}

function r() {
  local RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  local INITIAL_QUERY="function"
  local BLOCK=$(echo '' | fzf --bind "change:reload:$RG_PREFIX {q} || true" \
    --ansi --disabled  --delimiter : \
    --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
    --preview-window '~3,+{2}+3/2' \
  )
    if [[ -n $BLOCK ]]; then 
      local File=$( echo "$BLOCK" | awk -F ':' '{print $1 ,$2}' |cut -d ' ' -f 1 )
      local File2=$( echo "$BLOCK" | awk -F ':' '{print $1 ,$2}' |cut -d ' ' -f 2 )

      nvim $File "+:${File2}"
    fi




  }





# ---------------------------------------------------------------------------------------------------


function record() {


  local INRES="1920x1200"
  local OUTRES="1280x720"
  local FPS="30"

  ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -ac 2 \
    -i default -vcodec libx264 -s "$OUTRES" \
    -acodec libmp3lame -ab 128k -ar 44100 \
    -threads 0 -f flv $1


  }

# ---------------------------------------------------------------------------------------------------

function testing() {
  compadd "hello world"
}
# ---------------------------------------------------------------------------------------------------

_mycompletion() {
  local command_name="$1" # not used in this example
  local current_word="$2"
  local previous_word="$3" # not used in this example
  # COMPREPLY is an array which has to be filled with the possible completions
  # compgen is used to filter matching completions
  COMPREPLY=( $(compgen -W "$(ls | fzf -q $current_word )" -- "$current_word") )
}
complete -F _mycompletion mycommand
