if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll "exa -l -g --icons"
alias la "ll -a"
bind ` accept-autosuggestion

set fish_prompt_pwd_dir_length 0
set BAT_THEME "Visual Studio Dark+"
alias bat="bat --theme \"Visual Studio Dark+\""
set fish_greeting
zoxide init fish | source

alias update "brew update && brew upgrade && brew upgrade && brew upgrade --cask --greedy && brew cleanup && npm update -g && pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U | fisher update"
alias nv "nvim"


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

fzf_configure_bindings --dir=\cf
set fzf_preview_dir_cmd exa --all --color=always --icons
set fzf_fd_opts --hidden --exclude=.git