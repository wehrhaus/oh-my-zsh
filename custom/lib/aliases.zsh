############################################
#----------- Aliases Operations -----------#
#------------------------------------------#

## reload aliases
alias reload='source $ZSH/oh-my-zsh.sh'

alias aliasRefresh='source $CLIBS/aliases.zsh'

## open aliases
alias ea='atom -n $CLIBS/aliases.zsh'

## show all aliases
alias showa='$ZSH/custom/tools/readfile.sh $CLIBS/aliases.zsh'

function aliasSearch {
    showa | grep $1
}

################################
#----------- Finder -----------#
#------------------------------#
## Atom
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'

## Sublime Text 3
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

## open finder in current directory
alias o='open . &'

## open downloads
alias od='open ~/downloads'

###################################
#----------- Processes -----------#
#---------------------------------#

## start fenix
alias fenix='open "/Applications/Fenix.app"'

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

alias openzsh='atom $ZSH && atom ~/.zprofile && atom ~/.zshrc'

## install vim bundle
function getVimBundle {
    cd ~/.vim/bundle && git clone $1
}

alias zshCheatsheet='w3m https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet'

################################
#----------- Utils  -----------#
#------------------------------#

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
alias oh='atom -n /etc/hosts'

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

function addToGifs {
    curl -o ~/Pictures/GIFS/$1.gif $3 && echo "![$2]($1.gif)" >> README.md && git add . && git commit -m "New $1.gif" && git push
}

function sites {
    if [ $1 ]; then
        goto ~/Sites/$1
        atom .
    else
        goto ~/Sites/
    fi
}

#############################
#----------- SVN -----------#
#---------------------------#

## svn update current directory
alias svnup='svn update'

## make directory aware of .svnignore file
alias svnsetignore='svn propset svn:ignore -F .svnignore .'

## svn add all new files
function svnaddspec {
    svn add $(svn st | awk 'BEGIN{FS="       "} $1=="?" && $2 !~ /\.(sql|log|tmpl)$/ {print $2}')
}

## svn revert all missing modified files
function svnrevertmissingspec {
    svn revert $(svn st | awk 'BEGIN{FS="       "} $1=="!" && $2 !~ /\.(sql|log|tmpl)$/ {print $2}')
}

## svn revert all modified files
function svnrevertspec {
    svn revert $(svn st | awk 'BEGIN{FS="       "} $1=="M" && $2 !~ /\.(sql|log|tmpl)$/ {print $2}')
}

## svn commit current directory
function svncomm {
    svn commit -m "$1"
}

## svn update specific directory
function svnUpdateSpec {
    svn update $1
    cd $1
}

## svn update specific directory to specific directory
function svnUpdateSpecToSpec {
    cdTo $1
    svnUpdateSpec $2
}

#############################
#----------- GIT -----------#
#---------------------------#

## perform rebase on branch passed via arg
function update {
  git checkout $1 && git pull && git checkout - && git rebase $1
}

## perform merge on branch passed via arg
function merge {
  git checkout $1 && git pull && git checkout - && git merge $1
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

##########################################
#----------- DUNAMI Specifics -----------#
#----------------------------------------#
alias dpull='dunamiup; sleep 2; git pull; dunamidown'

alias dpush='dunamiup; sleep 2; git push; dunamidown'

function dcheckout {
  dunamiup && git checkout $1 && dunamidown
}

alias dunami='goto ~/Sites/dunami'

alias dunamipr='goto ~/Sites/dunami-client-pr'
