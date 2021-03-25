# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nguyenduyanh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="frisk"
# ZSH_THEME="jonathan"
ZSH_THEME="peepcode"
# ZSH_THEME="cypher"
ZSH_WEB_SEARCH_ENGINES=(
  uat  "https://console.tala.xyz/oms/order/"
  oms  "https://console.tiki.vn/oms/order/"
  jira  "https://jira.tiki.com.vn/browse/"

)
alias jira='web_search jira'
alias uat='web_search uat'
alias oms='web_search oms'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  tmux
  git
  web-search
  zsh-completions
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  # export EDITOR='vim'
# else
  # export EDITOR='mvim'
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

# alias vim='/usr/local/bin/nvim'
alias vi='/usr/local/bin/nvim'
alias zshcf='nvim ~/.zshrc'
alias nvimcf='nvim ~/.config/nvim/init.vim'
alias tmuxcf='nvim ~/.tmux.conf'
alias zshexec='. ~/.zshrc'
alias gcd='git checkout dev'
# alias python3='/usr/local/bin/python3'
# alias python='/usr/local/bin/python3'
alias alacf='nvim ~/.config/alacritty/alacritty.yml'
alias hypercf='nvim ~/.hyper.js'
alias sctmux='tmux source-file ~/.tmux.conf'
function gcob(){
  git checkout anhnguyen10/OMS-"$@"
}

function gnb(){
  git reset --hard
  git checkout master
  git pull
  git checkout -b anhnguyen10/OMS-"$@"
  git push --set-upstream origin anhnguyen10/OMS-"$@"
}

function glm(){
  git pull origin master
}
function glob(){
  git pull origin anhnguyen10/OMS-"$@"
}
function gchf(){
  git checkout hotfix
}
function glhf(){
  git pull origin hotfix
}
function gct(){
  git checkout test
}
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

ZSH_JIRA='https://jira.tiki.com.vn/secure/RapidBoard.jspa?rapidView=151&quickFilter=687'

function br(){
  if [[ "$1" == "jira" ]]; then
    open $ZSH_JIRA;
  else
    echo $1
    open $1
  fi
}
export JAVA_HOME=$(/usr/libexec/java_home -v 11.0)
R_URL='https://raine.github.io/ramda-json-docs/latest.json' alias R_DOC='curl -s https://raine.github.io/ramda-json-docs/latest.json' alias TEMP_CURL="curl --location --request GET 'https://api.tiki.vn/themis/users/accounts:1000294/groups?detail=1' --header 'authority: api.tiki.vn' --header 'authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InB1YmxpYzo1OThlYTNlOC1hYTAwLTQwZWMtOTdmMC1mOWVlMDFiYWI0YjIiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOlsidGlraS1jb25zb2xlIl0sImF1dGhfdGltZSI6MTU5NjAxNTI2MCwiZW1haWwiOiJhbmgubmd1eWVuMTBAdGlraS52biIsImV4cCI6MTU5NjA5MjkwMywiaWF0IjoxNTk2MDg5MzAzLCJpc3MiOiJodHRwczovL2FwaS50aWtpLnZuLyIsImp0aSI6IjZiY2M1YmU1LWUyMjEtNDAxNi05ODM3LTFjNDZmNWE3M2Q5YyIsIm5hbWUiOiJBbmggKEVuZ2luZWVyKS4gTmd1eWVuIER1eSIsIm5vbmNlIjoiIiwicmF0IjoxNTk2MDE1MjU5LCJzdWIiOiJhY2NvdW50czoxMDAwMzU4In0.NEmylI48iUuNXKZsQEb4_jt0_7xY3nMypB7_yEh4DBqF2B822qCmovZas1Q_NeN7OEPMANHlnyGakZrOy64qGOLNu-lyFVS_r7SKaRfqqqD8vGgBZ3orEajlyZCRjyNWdxC3n40yyyAKY1XhtBURxBYvG95cigJWkzuLAjLfFmT_8FbgMjRoeKvR2yag3YzXnXlSNvXmvhUbgOhhuIjbKpK4xN8-NNE1-zlOS_LjIZXUwkJ2xSwCr_xCqaNqaQmU9nLbbPY-mNG_qNb-qMerYOE0MHjUplmnsQCj7ioY4EsW6d1_uLKWohpPbxhC1PiRmc7ejcxI0Dp0DDd5A1xEI6BlqRHT4j0jtV-ItFsXMDXEjYHvQ1n0loJtWYzk1UQFPg3M__j3A5AVH1-7ETl4L0WbpVF2pXVhfALPG_RXbr6s4AE65mqL4azMCgzB4YQACX00yPQ1uSu43WsnNW19hAN0pRyyEfnqK67hwIaNvQlT7Tx5sMw2noyFxN2JxyKtfGcn642bLhEip8zU5cMKGVeg-znBk4huksQxxsvmQPPrfcM9gboATFgsfOTgdR82HCMpu1GjXVXmw2wBGD-sxzvxWMcHnbQ8SmmPwYpyHkzPpcLlyQf7fx2NKOvfhf6lPkH1QMMdItvMKv15b8bxUKYV5KrQjVcVnbEBtmjOwm4' --header 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36' --header 'content-type: application/json' --header 'accept: */*' --header 'origin: https://console.tiki.vn' --header 'sec-fetch-site: same-site' --header 'sec-fetch-mode: cors' --header 'sec-fetch-dest: empty' --header 'referer: https://console.tiki.vn/iam/user/accounts:1000294' --header 'accept-language: vi,en;q=0.9'"
alias R=ramda
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
[ -f "/Users/nguyenduyanh/.ghcup/env" ] && source "/Users/nguyenduyanh/.ghcup/env" # ghcup-env
eval "$(starship init zsh)"

source /Users/nguyenduyanh/.zsh/history.zsh
source /Users/nguyenduyanh/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias ls='ls -G'
source /Users/nguyenduyanh/.zsh/key-bindings.zsh
source /Users/nguyenduyanh/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Load completion config
#
source /Users/nguyenduyanh/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist


function precmd () {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## For MacOS
## Use this for Google Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
## Use this for Chrome Canary
alias chrome-canary="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary"
## Use this for Chromium
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
# source ~/.maven_bash_completion.bash
autoload -U compinit && compinit

alias ssh-nokia="ssh 192.168.1.9 -p 8022"
alias ssh-pi="ssh 192.168.1.8"
alias wifi-home="echo 0932071288"
alias nodejs="node"
alias mysql-tiki="mysql --login-path=remote"


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
