git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo " (%{\e[0;35m%}${ref#refs/heads/}%{\e[0m%})"
}


zelda () {
  if (( $+commands[pmset] )) ; then
    battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"

    if [[ $battery -lt 16 ]]; then
      echo "#[blink]♥#[noblink]♡♡♡♡♡"
    elif [[ $battery -lt 32 ]]; then
      echo "♥♡♡♡♡♡"
    elif [[ $battery -lt 48 ]]; then
      echo "♥♥♡♡♡♡"
    elif [[ $battery -lt 64 ]]; then
      echo "♥♥♥♡♡♡"
    elif [[ $battery -lt 80 ]]; then
      echo "♥♥♥♥♡♡"
    elif [[ $battery -lt 96 ]]; then
      echo "♥♥♥♥♥♡"
    else
      echo "♥♥♥♥♥♥"
    fi
  fi
}

set_prompt () {
  export PROMPT="$(zelda)$(git_prompt_info)"$' %{\e[0;36m%}%2/%{\e[0m%}/ ᗌ '
}

# gets called every time to display
precmd() {
  print -Pn "\e]0;%~\a"
  set_prompt
}
