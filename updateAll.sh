#!/opt/homebrew/bin/fish

# update brew
echo "--------------------------------"
echo "- Updaing Brew Packages        -"
echo "--------------------------------"

brew update && brew upgrade && brew cu -a -y --cleanup && brew cleanup

# update npm packages
echo "--------------------------------"
echo "- Updaing NPM Packages         -"
echo "--------------------------------"
npm update -g

# update python packages
echo "--------------------------------"
echo "- Updaing Pip Packages         -"
echo "--------------------------------"
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

# update python packages
echo "--------------------------------"
echo "- Updaing Rust Packages         -"
echo "--------------------------------"
cargo install-update -a

# update fish packages
echo "--------------------------------"
echo "- Updaing Fish Packages        -"
echo "--------------------------------"
fisher update

# update mac apps
echo "--------------------------------"
echo "- Updaing Mac Apps             -"
echo "--------------------------------"
mas upgrade
