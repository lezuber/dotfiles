source /usr/local/share/antigen/antigen.zsh
antigen init .antigenrc

DEFAULT_USER=`whoami`
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export CLICOLOR=1
export PATH=$PATH:/usr/local/sbin

#pyenv virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#vt aliases
alias sshvt='ssh lzuber@rlogin.cs.vt.edu -t zsh'
export vt='lzuber@rlogin.cs.vt.edu'

#aliases
alias l='ls -lah'
alias ls='ls -GFh'
alias vim='nvim'

#git aliases
alias lg='git lg'
alias g='git'


alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
