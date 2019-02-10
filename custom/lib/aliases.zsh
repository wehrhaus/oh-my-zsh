############################################
#----------- Aliases Operations -----------#
#------------------------------------------#

## reload aliases
alias reload='source $ZSH/oh-my-zsh.sh'

alias aliasRefresh='source $CLIBS/aliases.zsh'

## open aliases
alias ea='code -n $CLIBS/aliases.zsh'

## show all aliases
alias showa='$ZSH/custom/tools/readfile.sh $CLIBS/aliases.zsh'

function aliasSearch {
  showa | grep $1
}

################################
#----------- Finder -----------#
#------------------------------#

## open finder in current directory
alias o='open . &'

## open downloads
alias od='open ~/downloads'

## zip folder contents {name/folder}
function zipFolder {
  zip -r -X $1 ./
  if [ $2 ]; then
    cd $2
  fi
  zip -r -X $1 ./
}

###################################
#----------- Processes -----------#
#---------------------------------#

## open iPhone Simulator
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

## start python server
alias pServer='python -m SimpleHTTPServer'

## start browser sync
function bSync {
  browser-sync start --server --files "*.css, *.html, *.js"
}

########################################
#----------- ZSH/VIM Utils  -----------#
#--------------------------------------#

alias openzsh='code $ZSH ~/.zprofile ~/.zshrc'

## install vim bundle
function getVimBundle {
  cd ~/.vim/bundle && git clone $1
}

alias zshCheatsheet='w3m https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet'

################################
#----------- Utils  -----------#
#------------------------------#
alias clr='clear'

function copyToClipboard {
  pbcopy < $1
}

## create symlink from SOURCE to TARGET
function symlink {
  ln -s $1 $2
}

## show terminal history
alias h='history'

function goto {
  cd $1
}

## get IP Address
alias getip="ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'"

## kill specified process
function kill {
  sudo kill $1
}

## get pid running port $1
function portpid {
  lsof -n -i4TCP:$1 | grep LISTEN
}

## clear dns
alias cleardns='sudo killall -HUP mDNSResponder'

## open hosts
alias oh='sudo vim /etc/hosts'

## make file executable
function makeE {
  chmod +x $1
}

## make folder executable
function makeF {
  chmod 755 -R $1
}

## test find and replace file pattern (match/replace)
function findandreplace_test {
  find . -name '*'$1'*' -exec bash -c 'echo mv $0 ${0/'$1'/'$2'}' {} \;
}

## process find and replace file pattern (match/replace)
function findandreplace_process {
  find . -name '*'$1'*' -exec bash -c 'mv $0 ${0/'$1'/'$2'}' {} \;
}

function sites {
  if [ $1 ]; then
    goto ~/Sites/$1
    code .
  else
    goto ~/Sites/
  fi
}

#############################
#----------- GIT -----------#
#---------------------------#

## perform merge on branch passed via arg
function merge {
  git checkout $1 && git pull && git checkout - && git merge $1
}

## rename local git branch 'gitRenameLocal'
function gitRenameLocal {
  git branch -m $1
}

## rename remote git branch 'gitRenameRemote'
function gitRenameRemote {
  git branch -m $1
  git push origin :$1 $2
  git push origin -u $2
}

################################################
#----------- wehr.haus | webfaction -----------#
#----------------------------------------------#
## ssh into webfactional
alias jwssh='ssh jwehrman@jwehrman.webfactional.com'

alias suncityssh='ssh lonrusssctx@web555.webfaction.com'

#################################
#----------- Apache  -----------#
#-------------------------------#
alias editApache='subl /etc/apache2/ && oh'

function apacheCtl {
  echo $1'ing apache'
  sudo apachectl $1
}

alias apacheTest='apachectl configtest'

################################
#----------- NGINX  -----------#
#------------------------------#

## cd to nginx
alias gotoNginx='cd /usr/local/etc/nginx/'

## stop nginx
alias nginStop='sudo nginx -s stop'

## start nginx
function nginStart {
  perl -pe 's/DNS_SERVER/10.12.1.2/g' -i /usr/local/etc/nginx/conf.d/includes/resolver.includes
  sudo nginx
}

## restart nginx
alias nginRestart='nginStop && nginStart'

##################################
#----------- Vagrant  -----------#
#--------------------------------#

## list vagrant commands
function vagrantDic {
  echo 'Initialize machine: vagrant init {box}'
  echo 'See status of machine: vagrant status'
  echo 'Hibernate machine: vagrant suspend'
  echo 'Reboot machine: vagrant reload'
  echo 'Shutdown machine: vagrant shutdown'
  echo 'Remove machine: vagrant destroy'
  echo 'Recreate machine: vagrant up'
  echo 'Provision: vagrant up | vagrant reload -provision'
  echo 'List boxes: vagrant box list'
  echo 'Remove box: vagrant box remove {box}'
}
