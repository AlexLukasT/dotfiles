
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alex/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# load aliases
source $HOME/.aliases

# allow placeholders
setopt +o nomatch

# better zsh completion
zstyle ':completion:*' special-dirs true

# prompt style
PROMPT='%{$fg[magenta]%}%n%{$fg[blue]%}@%m%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)%{$fg[red]%}➜ %{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[green]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%} "

# add local pip to path
export PATH=$PATH:$HOME/.local/bin

# load nvm: ONLY ACTIVATE WHEN USING, THIS SLOWS DOWN THE START OF ZSH BY A LOT! 
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Solution from https://github.com/nvm-sh/nvm/issues/1277#issuecomment-536218082
# lazy loading the bash completions does not save us meaningful shell startup time, so we won't do it
export NVM_DIR="$HOME/.nvm"
# add our default nvm node (`nvm alias default 10.16.0`) to path without loading nvm
export PATH="$NVM_DIR/versions/node/v14.8.0/bin:$PATH"
#  alias `nvm` to this one liner lazy load of the normal nvm script
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

# change color of suggestions to have a larger contrast to the background
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#919191"

# remove underline of file paths
# see https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# set default editor
export EDITOR=nvim

export PATH=/usr/local/cuda-10.1/bin/:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:$LD_LIBRARY_PATH

# enable vim mode
#set -o vi

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

# save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}

# restore last saved path
#if [ -f ~/.last_dir ]
    #then cd `cat ~/.last_dir`
#fi

# place virtual environments created by pipenv in project folder
export PIPENV_VENV_IN_PROJECT=1

# use java 11
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# colors are hardcoded into kitty right now to avoid 
# loading problems with ranger
#(cat ~/.cache/wal/sequences &)

#ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue
#ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# set bat theme
#export BAT_THEME="ansi-dark"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf options
export FZF_DEFAULT_OPTS='--layout=reverse -e'
# use ag for faster file search
#export FZF_CTRL_T_COMMAND='ag --ignore *data* -l -g ""'
#export FZF_ALT_C_COMMAND='ag --ignore *data* -l -g ""'
export FZF_CTRL_T_COMMAND='fd --type f --exclude *data*'
export FZF_ALT_C_COMMAND='fd --type d --exclude *data*'

export PATH=$PATH:/home/alex/software/bin

# add maven to path
export PATH=/opt/apache-maven-3.8.1/bin:$PATH
