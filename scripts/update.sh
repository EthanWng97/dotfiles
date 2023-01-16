# update brew
echo "--------------------------------"
echo "- Updating Brew Packages       -"
echo "--------------------------------"
brew update && brew upgrade && brew cu -a -y --cleanup && brew cleanup && brew autoremove

# update npm packages
echo "--------------------------------"
echo "- Updating NPM Packages        -"
echo "--------------------------------"
npm update --location=global

# update python packages
echo "--------------------------------"
echo "- Updating Pip Packages        -"
echo "--------------------------------"
pip3 list --outdated | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

# update Rust packages
echo "--------------------------------"
echo "- Updating Rust Packages       -"
echo "--------------------------------"
cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

# update fish packages
echo "--------------------------------"
echo "- Updating Fish Packages       -"
echo "--------------------------------"
fish -c "fisher update"

# update mac apps
echo "--------------------------------"
echo "- Updating Mac Apps            -"
echo "--------------------------------"
mas upgrade

# update tmux plugins
echo "--------------------------------"
echo "- Updating Tmux Plugins        -"
echo "--------------------------------"
~/.config/tmux/plugins/tpm/bin/update_plugins all
