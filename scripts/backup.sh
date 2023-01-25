BREWFILE=~/Backup/Brewfile
CARGOFILE=~/Backup/Cargofile
FISHFILE=~/Backup/Fishfile
NPMFILE=~/Backup/Npmfile
PIPFILE=~/Backup/Pipfile

echo "---------------------------------"
echo "- Deleting old Backup Files     -"
echo "---------------------------------"
if [ -f "$BREWFILE" ]; then
	rm $BREWFILE
fi
if [ -f "$CARGOFILE" ]; then
	rm $CARGOFILE
fi
if [ -f "$FISHFILE" ]; then
	rm $FISHFILE
fi
if [ -f "$NPMFILE" ]; then
	rm $NPMFILE
fi
if [ -f "$PIPFILE" ]; then
	rm $PIPFILE
fi

echo "---------------------------------"
echo "- Dumping BREW and MAS packages -"
echo "---------------------------------"
brew bundle dump --describe --file=~/Backup/Brewfile

echo "---------------------------------"
echo "- Dumping NPM packages          -"
echo "---------------------------------"
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' >~/Backup/Npmfile

echo "---------------------------------"
echo "- Dumping PIP packages          -"
echo "---------------------------------"
pip3 freeze >~/Backup/Pipfile

echo "---------------------------------"
echo "- Dumping CARGO packages        -"
echo "---------------------------------"
cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ' >>~/Backup/Cargofile

echo "---------------------------------"
echo "- Dumping FISH packages         -"
echo "---------------------------------"
cp ~/.config/fish/fish_plugins ~/Backup/Fishfile
