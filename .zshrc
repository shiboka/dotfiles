PYTHON_ENABLED=true
ENSURE_INSTALLED='vim git net-tools dnsutils cowsay'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.nimble/bin:$HOME/.ruby/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias nas=/mnt/nas
#alias pak=/mnt/expansion-pak
#export dnas=/mnt/nas
#export dpak=/mnt/expansion-pak
#export dstor=/mnt/storage
#export dnvme=/mnt/nvme

PROMPT='%F{cyan}%n%F{magenta}@%F{cyan}%m%f:%F{magenta}%~ %(?.%F{green}.%F{red})%? %F{cyan}%# %f'

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export GEM_HOME=~/.ruby
export C_INCLUDE_PATH=/usr/include/lua5.1:$C_INCLUDE_PATH

if [[ $(($(apt list --installed $(echo $ENSURE_INSTALLED) | wc -l) - 1)) != $(echo $ENSURE_INSTALLED | tr -s ' ' '\n' | wc -l) ]]; then
  sudo apt install -y $(echo $ENSURE_INSTALLED)
fi

if $PYTHON_ENABLED; then
  if [[ ! -d $HOME/.pyenv ]]; then
    git clone https://github.com/pyenv/pyenv $HOME/.pyenv
    sudo apt install -y build-essential libssl-dev zlib1g-dev
    $HOME/.pyenv/bin/pyenv init

    print -P '%B%F{red}PLEASE RESTART YOUR SHELL'
    exit 0
  fi

  # PYENV
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - bash)"

  pyenv_ver=($(pyenv version))

  if [[ '3.12.9' != ${pyenv_ver[1]} ]]; then
    pyenv install 3.12.9
    pyenv global 3.12.9
  fi

  mkdir -p $HOME/.venv
  if [[ ! -d $HOME/.venv/home ]]; then
    python -m venv $HOME/.venv/home
  fi

  . $HOME/.venv/home/bin/activate

  if [[ ! $(pip freeze | grep pnu-fortune) ]]; then
    pip install pnu-fortune
    deactivate
    . $HOME/.venv/home/bin/activate
  fi
fi



if $PYTHON_ENABLED; then
  export FORTUNE_PATH=$HOME/.venv/home/share/games/fortune
  fortune -o | cowsay
fi

