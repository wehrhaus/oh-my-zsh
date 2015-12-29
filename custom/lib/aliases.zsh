############################################
#----------- Aliases Operations -----------#
#------------------------------------------#

## reload aliases
alias reload='source $ZSH/oh-my-zsh.sh'

alias aliasRefresh='source $CLIBS/aliases.zsh'

## open aliases
alias ea='subl -n $CLIBS/aliases.zsh'

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

###################################
#----------- Processes -----------#
#---------------------------------#

## start fenix
alias fenix='open "/Applications/Fenix.app"'

## open iPhone Simulator
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

########################################
#----------- ZSH/VIM Utils  -----------#
#--------------------------------------#

alias openzsh='subl $ZSH && subl ~/.zprofile && subl ~/.zshrc'

## install vim bundle
function getVimBundle {
    cd ~/.vim/bundle && git clone $1
}

alias zshCheatsheet='w3m https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet'

################################
#----------- Utils  -----------#
#------------------------------#

## show terminal history
alias h='history'

function goto {
    cd $1
}

## get IP Address
alias getip='ifconfig | grep "inet " | grep -v 127.0.0.1'

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
alias oh='subl -n /etc/hosts'

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
        subl .
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

########################################################
#----------- justinwehrman.com | webfaction -----------#
#------------------------------------------------------#
## ssh into webfactional
alias jwssh='ssh jwehrman@jwehrman.webfactional.com'

#################################
#----------- Apache  -----------#
#-------------------------------#
alias editApache='subl /etc/apache2/'

function apacheCtl {
    echo $1'ing apache'
    sudo apachectl $1
}

alias apacheTest='apachectl configtest'

###########################################
#----------- NERDERY Specifics -----------#
#-----------------------------------------#

## git clone from nerderylabs.com
function gitClone {
    sites && git clone git@git.nerderylabs.com:$1 && cd $1
}

## ssh into athens
alias athens='ssh athens.sierrabravo.net'

## ssh into london
alias london='ssh london.sierrabravo.net'

## ssh into victoria
alias victoria='ssh 204.62.150.50'
