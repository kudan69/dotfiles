git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo " (%{\e[0;35m%}${ref#refs/heads/}%{\e[0m%})"
}


zelda () {
  if (( $+commands[pmset] )) ; then
    battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"

    if [[ $battery -lt 16 ]]; then
      echo "%{\e[0;31m%}%{\e[5;31m%}♥%{\e[0m%}%{\e[0;31m%}♡♡♡♡♡%{\e[0m%}"
    elif [[ $battery -lt 32 ]]; then
      echo "%{\e[0;31m%}♥♡♡♡♡♡%{\e[0m%}"
    elif [[ $battery -lt 48 ]]; then
      echo "%{\e[0;31m%}♥♥♡♡♡♡%{\e[0m%}"
    elif [[ $battery -lt 64 ]]; then
      echo "%{\e[0;31m%}♥♥♥♡♡♡%{\e[0m%}"
    elif [[ $battery -lt 80 ]]; then
      echo "%{\e[0;31m%}♥♥♥♥♡♡%{\e[0m%}"
    elif [[ $battery -lt 96 ]]; then
      echo "%{\e[0;31m%}♥♥♥♥♥♡%{\e[0m%}"
    else
      echo "%{\e[0;31m%}♥♥♥♥♥♥%{\e[0m%}"
    fi
  fi
}

set_prompt () {
  export PROMPT=$'%{\e[0;41m%}%2/%{\e[0m%}/'"$(git_prompt_info)"$' ᗌ '
  export RPROMPT=$(zelda)
}

# gets called every time to display
precmd() {
  print -Pn "\e]0;%~\a"
  set_prompt
}
