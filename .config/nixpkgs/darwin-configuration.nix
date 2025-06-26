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
	
	#SYSTEM PACKAGE
	environment.systemPackages = with pkgs; [
		# SHELL
		git
		luajit
		neovim
		htop
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
		mediamtx

		# NVIM
		vimPlugins.gruber-darker-nvim
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
		vimPlugins.presence-nvim
		vimPlugins.mason-lspconfig-nvim
		vimPlugins.gitsigns-nvim
		vimPlugins.nvim-autopairs
		vimPlugins.comment-nvim

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
	  interactiveShellInit = ''

	    alias glp="git log --pretty=format:'%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s'"
	    alias gua="~/.local/bin/scripts/git-assume-unchanged.sh"
	    alias ll="ls -la"
	
	    export VI_MODE_SET_CURSOR=true
	    export PATH="/usr/local/bin:$PATH"
	    export EDITOR="nvim"
	    export VISUAL="nvim"
	    export GIT_EDITOR="nvim"
	
	    touchp() {
	      f="$1"
	      d="$(dirname "$f")"
	      mkdir -p "$d" && touch "$f"
	    }

	    source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
	    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	    source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
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
