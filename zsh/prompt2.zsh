txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
 
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
 
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
 
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
 
txtrst='\e[0m'    # Text Reset
# http://code.tutsplus.com/tutorials/how-to-customize-the-command-prompt--net-20586

git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo " (%{\e[0;32m%}${ref#refs/heads/}%{\e[0m%})"
}


zelda () {
  if (( $+commands[pmset] )) ; then
    battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"

    if [[ $battery -lt 16 ]]; then
      echo "%{\e[5;31m%}♥%{\e[0m%}♡♡♡♡♡"
    elif [[ $battery -lt 32 ]]; then
      echo "%{\e[0;31m%}♥%{\e[0m%}♡♡♡♡♡"
    elif [[ $battery -lt 48 ]]; then
      echo "%{\e[0;31m%}♥♥%{\e[0m%}♡♡♡♡"
    elif [[ $battery -lt 64 ]]; then
      echo "%{\e[0;31m%}♥♥♥%{\e[0m%}♡♡♡"
    elif [[ $battery -lt 80 ]]; then
      echo "%{\e[0;31m%}♥♥♥♥%{\e[0m%}♡♡"
    elif [[ $battery -lt 96 ]]; then
      echo "%{\e[0;31m%}♥♥♥♥♥%{\e[0m%}♡"
    else
      echo "%{\e[0;31m%}♥♥♥♥♥♥%{\e[0m%}"
    fi
  fi
}

set_prompt () {
  # if [[ -n $SSH_CONNECTION ]]; then
  #   export PROMPT=$'%m:%3~%{\e[0;41m%}%2/%{\e[0m%}/'"$(git_prompt_info)"$' ᗌ '
  # else
  export PROMPT=$'%{\e[0;41m%}%2/%{\e[0m%}/'"$(git_prompt_info)"$' ᗌ '
  # fi
  export RPROMPT=$(zelda)
}

# gets called every time to display
precmd() {
  print -Pn "\e]0;%~\a"
  set_prompt
}
