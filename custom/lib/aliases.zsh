############################################
#----------- Aliases Operations -----------#
#------------------------------------------#

## reload aliases
alias reload='source $ZSH/oh-my-zsh.sh'

## open aliases
alias ea='subl -n $CLIBS/aliases.zsh'

## show all aliases
alias showa='$ZSH/custom/tools/readfile.sh $CLIBS/aliases.zsh'

## clear dns
alias cleardns='sudo killall -HUP mDNSResponder'

################################
#----------- Finder -----------#
#------------------------------#

## open finder in current directory
alias o='open . &'

## open iPhone Simulator
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

## open downloads
alias od='open ~/downloads'

## open hosts
alias oh='subl -n /etc/hosts'

###################################
#----------- Processes -----------#
#---------------------------------#
## start fenix
alias fenix='open "/Applications/Fenix.app"'

## show terminal history
alias h='history'

## kill specified process
function kill {
    sudo kill $1
}

## get pid running port $1
function portpid {
    lsof -n -i4TCP:$1 | grep LISTEN
}

################################
#----------- Utils  -----------#
#------------------------------#

## get IP Address
alias getip='ifconfig | grep "inet " | grep -v 127.0.0.1'

## open activity monitor
alias am='open "/Applications/Utilities/Activity Monitor.app"'

## open ffb in firefox
alias ffb='open -a Firefox http://games.espn.go.com/ffl/leagueoffice?leagueId=505064'

## test find and replace file pattern (match/replace)
function findandreplace_test {
    find . -name '*'$1'*' -exec bash -c 'echo mv $0 ${0/'$1'/'$2'}' {} \;
}

## process find and replace file pattern (match/replace)
function findandreplace_process {
    find . -name '*'$1'*' -exec bash -c 'mv $0 ${0/'$1'/'$2'}' {} \;
}

## make file executable
function makeE {
    chmod +x $1
}

## make folder executable
function makeF {
    chmod 755 -R $1
}

function addToGifs {
    curl -o ~/Pictures/GIFS/$1.gif $3 && echo "![$2]($1.gif)" >> README.md && git add . && git commit -m "New $1.gif" && git push
}

#####################################
#----------- Directories -----------#
#-----------------------------------#

## open Sites
function sites {
    if [ $1 ]; then
        goto ~/Sites/$1
        subl .
    else
        goto ~/Sites/
    fi
}

## open sites_creative
function assets {
    if [ $1 ]; then
        goto ~/Sites_Creative/$1
    else
        goto ~/Sites_Creative/
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

##################################
#----------- JPMorgan -----------#
##################################

alias jpmServer='cd ~/Sites/VML/JPMorgan/gbwm-rest-standalone'
alias jpmDev='cd ~/Sites/VML/JPMorgan/goal-based-planner-client'
alias jpmStartDev='jpmDev && npm run start'