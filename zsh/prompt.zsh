autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo " $(rb_prompt) %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " $(rb_prompt) %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
	  echo "%{$fg_bold[yellow]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
	else
	  echo ""
  fi
}


directory_name(){
  #export PS1='%2/ ~ '
  echo "%{$fg_bold[cyan]%}%2/%\/%{$reset_color%}"
}

export PROMPT=$'$(directory_name)$(git_dirty)$(need_push) ᗌ '

#set_prompt () {
#  export RPROMPT="%{$fg_bold[cyan]%}$(todo)%{$reset_color%}"
#}

set_term_tab() {
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a" 
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  #set_term_tab
  #set_prompt
}
