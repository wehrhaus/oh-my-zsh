############################################
#----------- Aliases Operations -----------#
#------------------------------------------#

## [reload] - reloads oh-my-zsh.sh
alias reload='source $ZSH/oh-my-zsh.sh'

## [aliasRefresh] - refreshes aliases
alias aliasRefresh='source $CLIBS/aliases.zsh'

## [ea] - open aliases
alias ea='code -n $CLIBS/aliases.zsh'

## [showa] - show all aliases
alias showa='$ZSH/custom/tools/readfile.sh $CLIBS/aliases.zsh'

## [aliasSearch] - grep aliases
function aliasSearch() {
  showa | grep $1
}

################################
#----------- Finder -----------#
#------------------------------#

## [o] - open finder in current directory
alias o='open . &'

## [od] -open downloads
alias od='open ~/downloads'

## zip folder contents {name/folder}
function zipFolder() {
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
function bSync() {
  browser-sync start --server --files "*.css, *.html, *.js"
}

########################################
#----------- ZSH/VIM Utils  -----------#
#--------------------------------------#

alias openzsh='code $ZSH ~/.zprofile ~/.zshrc'

## install vim bundle
function getVimBundle() {
  cd ~/.vim/bundle && git clone $1
}

alias zshCheatsheet='w3m https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet'

################################
#----------- Utils  -----------#
#------------------------------#
alias clr='clear'

function copyToClipboard() {
  pbcopy <$1
}

## create symlink from SOURCE to TARGET
function symlink() {
  ln -s $1 $2
}

## show terminal history
alias h='history'

function goto() {
  cd $1
}

## get IP Address
alias getip="ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'"

## kill specified process
function kill() {
  sudo kill $1
}

## get pid running port $1
function portpid() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

## clear dns
alias cleardns='sudo killall -HUP mDNSResponder'

## open hosts
alias oh='sudo vim /etc/hosts'

## make file executable
function makeE() {
  chmod +x $1
}

## make folder executable
function makeF() {
  chmod 755 -R $1
}

## test find and replace file pattern (match/replace)
function findandreplace_test() {
  find . -name '*'$1'*' -exec bash -c 'echo mv $0 ${0/'$1'/'$2'}' {} \;
}

## process find and replace file pattern (match/replace)
function findandreplace_process() {
  find . -name '*'$1'*' -exec bash -c 'mv $0 ${0/'$1'/'$2'}' {} \;
}

function sites() {
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
function merge() {
  git checkout $1 && git pull && git checkout - && git merge $1
}

## rename local git branch 'gitRenameLocal'
function gitRenameLocal() {
  git branch -m $1
}

## rename remote git branch 'gitRenameRemote newName oldName'
function gitRenameRemote() {
  git branch -m $1
  git push origin :$2 $1
  git push origin -u $1
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

function apacheCtl() {
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
function nginStart() {
  perl -pe 's/DNS_SERVER/10.12.1.2/g' -i /usr/local/etc/nginx/conf.d/includes/resolver.includes
  sudo nginx
}

## restart nginx
alias nginRestart='nginStop && nginStart'

#########################################
#----------- Android Studio  -----------#
#--------------------------------------##
function astd() {
  open -a /Applications/Android\ Studio.app $1
}

##################################################
#----------- React Native :: Android  -----------#
#-----------------------------------------------##

## [droidDevices] - list android Virtual Devices
alias droidDevices='emulator -list-avds'

## [droidLaunchDevice] - launch android {device}
function droidLaunchDevice() {
  $ANDROID_HOME/tools/emulator -avd $1
}

## [droidLaunch {device}] - launches android emulator - defaults to device Pixel_2_API_27
function droidLaunch() {
  if [ $1 ]; then
    droidLaunchDevice $1
  else
    droidLaunchDevice Nexus_6_API_30
  fi
}

## [droidMenu] - launch react native dev menu
alias droidMenu='adb shell input keyevent 82'

## [droidProxy {port}] - sets reverse proxy for adb - defaults to 8081
function droidProxy() {
  if [ $1 ]; then
    adb reverse tcp:$1 tcp:$1
  else
    adb reverse tcp:8081 tcp:8081
  fi
}

## [droidDeepLink {path}] - trigger deep link to intent - defaults to hull
function droidDeepLink() {
  if [ $1 ]; then
    adb shell am start -a android.intent.action.VIEW -d $1 com.estrackmobile
  else
    adb shell am start -a android.intent.action.VIEW -d "eslink://login?userId=3181\&companyId=3138\&roleId=2\&token=10f10de4-e7c6-4184-837e-62e009495947\&mimic=true" com.estrackmobile
  fi
}

## [droidKill {emulator_id}] - kill emulator
function droidKill() {
  if [ $1 ]; then
    adb -s $1 emu kill
  else
    adb -s emulator-5554 emu kill
  fi
}

#########################################
#----------- EquipmentShare  -----------#
#---------------------------------------#

## [eshare] - cd to EquipmentShare
alias eshare='sites && cd EquipmentShare'

## [esnode] - set node to 10.15 for ci tests
alias esnode='nvm install 10.15 && nvm use 10.15'
