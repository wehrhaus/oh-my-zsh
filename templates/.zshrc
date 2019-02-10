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
plugins=(git)

# User configuration
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

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/jwehrman/sdks/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jwehrman/sdks/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/jwehrman/sdks/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jwehrman/sdks/google-cloud-sdk/completion.zsh.inc'; fi
