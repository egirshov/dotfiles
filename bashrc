export PS1='[\h \w\$(__git_ps1 " (%s)")]\$ '
export PS1='[\h $(date +"%a %d %b  %T") \w]\n[\W\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[00m\]]\$ '
export EDITOR=vim

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

function review() {
  [ -z "$1" ] && exit
  [ -f "$1" ] || exit
  if [ -f "$1.new" ] ; then
    vimdiff $1 $1.new
  else 
    mv $1 $1.new
    git checkout $1
    vimdiff $1 $1.new
  fi
}
