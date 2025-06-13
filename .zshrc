# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#echo " ██████╗  █████╗ ██╗  ██╗██╗   ██╗██╗      "
#echo " ██╔══██╗██╔══██╗██║  ██║██║   ██║██║      "
#echo " ██████╔╝███████║███████║██║   ██║██║      "
#echo " ██╔══██╗██╔══██║██╔══██║██║   ██║██║      "
#echo " ██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗ "
#echo " ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ "
                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                 
export PATH="$HOME/.ghcup/bin:$PATH"

# Environment Variables
if [[ "$OSTYPE" == "darwin"* ]]; then # MacOS
   export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

   # Graphics env variables
   export GLM_INCLUDE_DIR=/usr/local/Cellar/glm/0.9.8.1/include
   export GLFW_DIR=$HOME/open-source-bin/glfw-3.2.1
   export GLEW_DIR=/usr/local/Cellar/glew/2.0.0

   # Audio Api Variables
   export FMOD_DIR=$HOME/open-source-bin/FMOD_API

   # Custom Python3 Paths
   export PYTHONPATH=${PYTHONPATH}:$HOME/Projects/SearchEngine/

   # OpenSSL env vars since OSX is phasing it out. These depend on Homebrew.
   export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
   export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
   #export DEP_OPENSSL_INCLUDE=`brew --prefix openssl`/include

   # Export the Java path if available, haven't found a better way to do it
   export JAVA_HOME=`/usr/libexec/java_home`
elif [[ "$OSTYPE" == "linux-gnu" ]]; then # Linux
   export LS_COLORS='rs=0:di=01;36:ln=0;95:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme and theme configurations
ZSH_THEME="fox"

# Spaceship theme configurations
# Prompt
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_BATTERY_SHOW=false

# Directory
SPACESHIP_DIR_TRUNC=1
SPACESHIP_DIR_TRUNC_REPO=false

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins for ZSH
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
   git
   zsh-syntax-highlighting
   web-search
   zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Aliases
# For a full list of active aliases, run `alias`.
# JSON formatting utility
alias prettyjson="python3 -m json.tool"
alias pomo=~/.local/bin/scripts/pomo/pomo.sh
alias fzf="fzf --color='bg:#faf4ed,bg+:#f2e9e1,info:#575279,border:#9893a5,spinner:#d7827e' --color='hl:#907aa9,fg:#575279,header:#797593,fg+:#575279' --color='pointer:#907aa9,marker:#907aa9,prompt:#907aa9,hl+:#797593',gutter:-1"
alias nvimp="nvim | fzf --preview='cat {}'"

# git log pretty
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'
alias gua=~/.local/bin/scripts/git-assume-unchanged.sh


eval "$(zoxide init zsh)"

# alias nvim="nvim --clean"
#
# Distribution specific definitions
if [[ "$OSTYPE" == "darwin"* ]]; then # MacOS
   # Wifi alias on/off
   WIFI_PORT='en0'
   alias wifi="networksetup -setairportpower $WIFI_PORT"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then # Linux
   :
fi

# Startup commands
# if [[ "$OSTYPE" == "darwin"* ]]; then # MacOS
#    eval "$(rbenv init -)"
# fi

# Optional startup commands
#screenfetch -E
#fortune | cowsay -f moose | lolcat

eval "$(starship init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=/Users/rahulnavneeth/.meteor:$PATH

export VI_MODE_SET_CURSOR=true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rahulnavneeth/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rahulnavneeth/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rahulnavneeth/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rahulnavneeth/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/rahulnavneeth/.opam/opam-init/init.zsh' ]] || source '/Users/rahulnavneeth/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

[ -f "/Users/rahulnavneeth/.ghcup/env" ] && . "/Users/rahulnavneeth/.ghcup/env" # ghcup-env

 # Nix
 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi
 # End Nix
 
touchp() {
  f="$1"
  d="$(dirname "$f")"
  mkdir -p "$d" && touch "$f"
}
