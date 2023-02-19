if status is-interactive
    # Commands to run in interactive sessions can go here
end

# general setting
fish_add_path ~/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
bind ` accept-autosuggestion
bind \co 'open .'
bind \ce 'xplr'
bind -M insert ` accept-autosuggestion
fzf_configure_bindings --git_status=\cg --git_log=\cl --history=\cr --variables=\cv --directory=\cf --processes=\cp


# alias and abbr setting
alias ls "exa --color=always --icons --group-directories-first"
alias la 'exa --color=always --icons --group-directories-first --all'
alias ll 'exa --color=always --icons --group-directories-first --all --long'
alias lt 'exa --tree --color=always --icons --group-directories-first --all'
# alias bat="bat --theme \"Visual Studio Dark+\""
alias nv nvim
alias lg lazygit

abbr ta "tmux attach -t"
abbr tn "tmux new -s"
abbr tl "tmux ls"
abbr tk "tmux kill-session -t"

# command setting
zoxide init fish | source
starship init fish --print-full-init | source

set fish_cursor_insert line
set fish_cursor_replace_one underscore
# fzf_configure_bindings --dir=\cf
set fzf_preview_dir_cmd exa --all --color=always --icons
set fzf_fd_opts --hidden --no-ignore
set -gx EDITOR nvim
# set -Ux FZF_DEFAULT_OPTS --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
set fish_prompt_pwd_dir_length 0
set BAT_THEME Dracula
set -x STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
set -x LG_CONFIG_FILE "/Users/navepnow/.config/lazygit/config.yml"
set -Ux BAT_THEME Dracula
set fish_greeting
