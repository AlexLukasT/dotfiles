# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alex/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
  docker-compose
  zsh-completions
  tldr
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# load aliases
source $HOME/.aliases

# allow placeholders
setopt +o nomatch

# better zsh completion
zstyle ':completion:*' special-dirs true

# change color of suggestions to have a larger contrast to the background
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#919191"

# remove underline of file paths
# see https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# set default editor
export EDITOR=nvim

# remap keys for accepting autosuggestions
bindkey '^K' autosuggest-accept
bindkey '^L' autosuggest-execute

# define function that retrieves and runs last command
function run-again {
    # get previous history item
    zle up-history
    # confirm command
    zle accept-line
}

# define run-again widget from function of the same name
zle -N run-again

# bind widget to Ctrl+X in
bindkey '^X' run-again

# fix xclip throwing an error on shell startup when the clipboard is empty
# see: https://github.com/astrand/xclip/issues/38
# echo tmp | xclip -i -selection c

# place virtual environments created by pipenv in project folder
export PIPENV_VENV_IN_PROJECT=1

# load fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# fzf options
export FZF_DEFAULT_OPTS='--layout=reverse -e'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

# path stuff
export PATH=$PATH:$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin:$HOME/go/bin
