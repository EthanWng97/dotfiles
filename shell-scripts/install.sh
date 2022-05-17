BREWFILE=~/Backup/Brewfile
CARGOFILE=~/Backup/Cargofile
FISHFILE=~/Backup/Fishfile
NPMFILE=~/Backup/Npmfile
PIPFILE=~/Backup/Pipfile

# echo "------------------------------------"
# echo "- Installing BREW and MAS packages -"
# echo "------------------------------------"
# brew bundle install --file=~/Backup/Brewfile
#
# echo "------------------------------------"
# echo "- Installing NPM packages          -"
# echo "------------------------------------"
# npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' >~/Backup/Npmfile
#
# echo "------------------------------------"
# echo "- Installing PIP packages          -"
# echo "------------------------------------"
# pip install -r ~/Backup/Pipfile
#
# echo "------------------------------------"
# echo "- Installing CARGO packages        -"
# echo "------------------------------------"
# xargs cargo install <~/Backup/Cargofile

echo "------------------------------------"
echo "- Installing FISH packages         -"
echo "------------------------------------"
for PLUGIN in $(cat $FISHFILE); do
	echo $PLUGIN
	fish -c "fisher install $PLUGIN"
done

echo "------------------------------------"
echo "- Installing TPM packages          -"
echo "------------------------------------"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/bin/install_plugins

echo "------------------------------------"
echo "- Installing NVIM packages         -"
echo "------------------------------------"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim -c 'PackerSync'
