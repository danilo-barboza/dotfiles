export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles/

ZSH_THEME="purish"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fasd colored-man brew zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases.zsh

export JAVA_HOME=`/usr/libexec/java_home`