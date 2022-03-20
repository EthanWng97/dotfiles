if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll "exa -l -g --icons"
alias la "ll -a"

set fish_prompt_pwd_dir_length 0
set BAT_THEME Dracula
set -x LS_COLORS (vivid generate dracula)
set -x STARSHIP_CONFIG "$HOME/.config/starship.toml"
alias bat="bat --theme \"Visual Studio Dark+\""
set fish_greeting
zoxide init fish | source

alias update "brew update && brew upgrade && brew cu -a&& brew cleanup && npm update -g && pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U | fisher update"
alias nv nvim


fish_add_path ~/.cargo/bin
fish_add_path /opt/homebrew/bin
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

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

bind ` accept-autosuggestion
# fzf_configure_bindings --dir=\cf
fzf_configure_bindings --git_status=\cg --history=\cr --variables=\cv --directory=\cf --git_log
set fzf_preview_dir_cmd exa --all --color=always --icons
set fzf_fd_opts --hidden
starship init fish --print-full-init | source
set -gx EDITOR nvim
set -Ux FZF_DEFAULT_OPTS --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
