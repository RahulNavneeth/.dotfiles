FOLDERS=$(find ~/Documents/ ~/Downloads/ ~/.local/ ~/.config/ ~/projects ~/projects/open-source -mindepth 1 -maxdepth 1 -type d)
TMUX_LIST=$(tmux list-sessions -F "#{session_name}" 2> /dev/null)

if [[ $# -eq 1 ]]; then
    selected=$1
else
# solarised-dark selected=`printf "$FOLDERS\n$TMUX_LIST" | fzf --color='bg:#002b36,bg+:#003541,info:#93a1a1,border:#465057,spinner:#839496' --color='hl:#586e75,fg:#93a1a1,header:#465057,fg+:#839496' --color='pointer:#839496,marker:#586e75,prompt:#586e75,hl+:#839496',gutter:-1 --bind='tab:down,shift-tab:up'`
# solarised-light selected=`printf "$FOLDERS\n$TMUX_LIST" | fzf --color='bg:#fdf6e3,bg+:#eee8d5,info:#93a1a1,border:#93a1a1,spinner:#657b83' --color='hl:#586e75,fg:#657b83,header:#93a1a1,fg+:#586e75' --color='pointer:#268bd2,marker:#d33682,prompt:#586e75,hl+:#268bd2',gutter:-1 --bind='tab:down,shift-tab:up'`
selected=`printf "$FOLDERS\n$TMUX_LIST" | fzf --color='bg:#191724,bg+:#26233a,info:#6e6a86,border:#6e6a86,spinner:#e0def4' --color='hl:#9ccfd8,fg:#e0def4,header:#6e6a86,fg+:#e0def4' --color='pointer:#c4a7e7,marker:#eb6f92,prompt:#e0def4,hl+:#9ccfd8',gutter:-1 --bind='tab:down,shift-tab:up'`
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

# if [[ $selected == $selected_name ]]; then
#     read -p "NEW (YES/NO)" add
#     add=`echo $add | tr ' ' '+'`
#     if [[ $add == "YES" ]]; then
#         tmux new-session -ds $selected_name
#     else
# else

tmux switch-client -t $selected_name
