# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wehrhaus"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv)

# User configuration
# export PATH=/usr/local/bin:/usr/local/opt/python/libexec/bin:$PATH
export CLIBS=$ZSH/custom/lib

source $ZSH/oh-my-zsh.sh

# custom libs
. $ZSH/custom/tools/sourceFiles.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
. $ZSH/custom/lib/aliases.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ES SPECIFIC
export LEVEL=stage
export AWS_PROFILE=stage-esapi
export PYTHONUNBUFFERED=1

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.fastlane/bin:$HOME/.flutter/bin:/usr/local/opt/dart/libexec:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Sites/EquipmentShare
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$PATH:/Users/justinwehrman/.nvm/versions/node/v14.5.0/bin"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
export PATH="/usr/local/bin/charm:$PATH" #pycharm

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export FLUTTER_ROOT="$HOME/.flutter/bin"
export DART_ROOT="/usr/local/opt/dart/libexec"

eval "$(pyenv init -)"

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export CPATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin `xcrun --show-sdk-path`/usr/include"
