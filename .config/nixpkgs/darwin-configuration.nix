{ config, pkgs, ... }:

{
	nix.enable = true;
	nix.package = pkgs.nix;

	system.primaryUser = "rahulmnavneeth";

	nixpkgs.config = {
    	# allowUnsupportedSystem = true;
    	# allowBroken = true;
    	allowUnfree = true;
	};

	ids.gids.nixbld = 350;

	nix.settings.experimental-features = ["nix-command" "flakes"];

	environment.variables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
		GIT_EDITOR = "nvim";
	};

environment.etc."zshenv".text = ''
  # Disable zsh-newuser-install
  DISABLE_AUTO_UPDATE=true
  skip_global_compinit=1
'';
	
	#SYSTEM PACKAGE
	environment.systemPackages = with pkgs; [
		# SHELL
		git
		luajit
		neovim
		btop
		zsh
		tree
		wget
		curl
		emacsPackages.pbcopy
		stow
		tmux
		ffmpeg
		ripgrep
		yt-dlp
		colima
		docker_26
		direnv

		# YASKELL
		haskellPackages.threadscope

		# NVIM
		vimPlugins.gruber-darker-nvim
		vimPlugins.undotree
		vimPlugins.telescope-nvim
		vimPlugins.plenary-nvim
		vimPlugins.oil-nvim
		vimPlugins.transparent-nvim
		vimPlugins.nvim-treesitter
		vimPlugins.mason-nvim
		vimPlugins.mason-lspconfig-nvim
		vimPlugins.gitsigns-nvim
		vimPlugins.nvim-autopairs
		vimPlugins.comment-nvim
		vimPlugins.nvim-cmp
		vimPlugins.cmp-nvim-lsp
		vimPlugins.luasnip
		vimPlugins.cmp_luasnip
		vimPlugins.friendly-snippets
		vimPlugins.undotree
		vimPlugins.harpoon

		# ZSH
		zsh-history-substring-search
		zsh-syntax-highlighting
		zsh-vi-mode

		sketchybar
		
		# GUI APPS
		alacritty
		brave
		obsidian
		iina
		# vlc
	];

	# SHELL
	programs.zsh = {
	  enable = true;
	  enableCompletion = true;
	  
	  enableBashCompletion = true;
	  
	  promptInit = ''
	    # Disable zsh new user install
	    export ZDOTDIR="$HOME"
	    
	    # Enable prompt substitution
	    setopt PROMPT_SUBST
	    
	    # Git branch function
	    git_branch() {
	      local branch
	      branch=$(git symbolic-ref --short HEAD 2>/dev/null)
	      if [[ -n "$branch" ]]; then
	        echo " (%F{green}$branch%f)"
	      fi
	    }
	
	    # Relative path function (show path relative to home)
	    relative_path() {
	      local current_path="''${PWD/#''$HOME/~}"
	      echo "%F{blue}$current_path%f"
	    }
	
	    # Nix shell indicator
	    nix_shell_indicator() {
	      if [[ -n "$IN_NIX_SHELL" ]]; then
	        echo "%F{yellow}[nix-shell]%f "
	      fi
	    }
	
	    # Set the custom prompt
	    PROMPT='$(nix_shell_indicator)$(relative_path)$(git_branch) %# '
	  '';
	  
	  interactiveShellInit = ''
	    # Disable zsh-newuser-install function
	    zstyle ':completion:*' rehash true
	    
	    # Existing aliases
	    alias glp="git log --pretty=format:'%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s'"
	    alias gua="~/.local/bin/scripts/git-assume-unchanged.sh"
	    alias ll="ls -la"
		alias vn="ffplay ~/Downloads/vinveli-nayagaaaaaaa.mp3"
	
	    # Existing exports
	    export VI_MODE_SET_CURSOR=true
	    export PATH="/usr/local/bin:$PATH"
	    export EDITOR="nvim"
	    export VISUAL="nvim"
	    export GIT_EDITOR="nvim"
	
	    # Existing function
	    touchp() {
	      f="$1"
	      d="$(dirname "$f")"
	      mkdir -p "$d" && touch "$f"
	    }
	
	    # History configuration for better prefix search
	    HISTSIZE=10000
	    SAVEHIST=10000
	    setopt HIST_FIND_NO_DUPS
	    setopt HIST_IGNORE_ALL_DUPS
	    setopt HIST_SAVE_NO_DUPS
	    setopt SHARE_HISTORY
	    setopt APPEND_HISTORY
	    setopt INC_APPEND_HISTORY
	
	    # Load plugins in the correct order
	    # 1. First load vi-mode
	    source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
	
  		export DIRENV_LOG_FORMAT=""
  		eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
	    
	    # 2. Then load history substring search
	    source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
	    
	    # 3. Load syntax highlighting last (it should be loaded after all other plugins)
	    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	
	    # History substring search configuration (must be after sourcing the plugin)
	    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
	    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
	    HISTORY_SUBSTRING_SEARCH_FUZZY=0
	    HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
	
	    # Set up key bindings after vi-mode is initialized
	    zvm_after_init() {
	      # Bind Up/Down arrow keys for history substring search
	      bindkey "^[[A" history-substring-search-up
	      bindkey "^[[B" history-substring-search-down
	    }
	
	    # Also set up bindings for non-vi mode users as fallback
	    bindkey "^[[A" history-substring-search-up
	    bindkey "^[[B" history-substring-search-down
	  '';
	};

	environment.shells = [ pkgs.zsh ];

	users.users.rahulmnavneeth = {
		name = "rahulmnavneeth";
		home = "/Users/rahulmnavneeth";
	};

	system.stateVersion = 4;

	services.yabai.enable = true;
	services.skhd.enable = true;

	homebrew = {
		enable = true;
		taps = [
		  	"koekeishiya/formulae"
		];
		casks = [
			"karabiner-elements"
		];
		brews = [
    		"koekeishiya/formulae/yabai"
    		"koekeishiya/formulae/skhd"
		];
	};

	launchd.user.agents.sketchybar = {
		command = "${pkgs.sketchybar}/bin/sketchybar";
		serviceConfig = {
			RunAtLoad = true;
			KeepAlive = true;
			EnvironmentVariables = {
				PATH = "${pkgs.sketchybar}/bin:/usr/bin:/bin:/usr/sbin:/sbin";
			};
		};
	};
}
