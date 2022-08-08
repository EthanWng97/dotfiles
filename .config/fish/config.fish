if status is-interactive
    # Commands to run in interactive sessions can go here
end

# general setting
fish_add_path ~/.cargo/bin
fish_add_path /opt/homebrew/bin
bind ` accept-autosuggestion
bind -M insert ` accept-autosuggestion
fzf_configure_bindings --git_status=\cg --git_log=\cl --history=\cr --variables=\cv --directory=\cf --processes=\cp


# alias and abbr setting
alias ls exa
alias ll "exa -l -g --icons"
alias la "ll -a"
alias tn "tmux new -s"
alias tl 'tmux list-sessions'
alias bat="bat --theme \"Visual Studio Dark+\""
alias nv nvim
alias lg lazygit
alias update '~/scripts/./update.sh'
alias backup '~/scripts/./backup.sh'
alias install '~/scripts/./install.sh'

abbr ta "tmux attach -t"

function rga-fzf
    set -x RG_PREFIX rga --files-with-matches
    set -l file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv'" \
            fzf --sort --preview="[ ! -z {} ] && rga --pretty --context 5 {q} {}" \
                --phony -q "$argv" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
    ) &&
        open "$file"
end

# command setting
zoxide init fish | source
thefuck --alias | source
starship init fish --print-full-init | source

set fish_cursor_insert line
set fish_cursor_replace_one underscore
# fzf_configure_bindings --dir=\cf
set fzf_preview_dir_cmd exa --all --color=always --icons
set fzf_fd_opts --hidden --no-ignore
set -gx EDITOR nvim
set -Ux FZF_DEFAULT_OPTS --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
set fish_prompt_pwd_dir_length 0
set BAT_THEME Dracula
set -x LS_COLORS (vivid generate dracula)
set -x STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
set -x HDF5_DIR /opt/homebrew/Cellar/hdf5/1.13.0
set -x LG_CONFIG_FILE "/Users/navepnow/.config/lazygit/config.yml"
set fish_greeting
