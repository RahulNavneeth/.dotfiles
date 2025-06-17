{ config, pkgs, ... }:

{
	nix.enable = true;
	nix.package = pkgs.nix;

	system.primaryUser = "rahulmnavneeth";

	nixpkgs.config.allowUnfree = true;

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
		neovim
		htop
		zsh
		tree
		wget
		curl
		emacsPackages.pbcopy
		stow
		tmux

		yabai
		skhd
		sketchybar
		
		# GUI APPS
		alacritty
		brave
		obsidian
	];

	# SHELL
	programs.zsh = {
	  enable = true;
	  enableCompletion = true;
	  interactiveShellInit = ''
alias glp="git log --pretty=format:'%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s'";
alias gua="~/.local/bin/scripts/git-assume-unchanged.sh";
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_DIR_TRUNC=1
SPACESHIP_DIR_TRUNC_REPO=false
HYPHEN_INSENSITIVE="true"

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
		casks = [
			"karabiner-elements"
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
