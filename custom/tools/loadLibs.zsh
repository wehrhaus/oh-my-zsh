# Load all of the custom lib files in ~/oh-my-zsh/custom/lib
for config_file ($ZSH/custom/lib/*); do
  source $config_file
done