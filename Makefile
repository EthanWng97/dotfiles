DOT_SCRIPTS = ./scripts
.PHONY: backup

update:
	@echo "~>> [[ Updating ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/update.sh

backup:
	@echo "~>> [[ Backing up ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/backup.sh

install:
	@echo "~>> [[ Installing ]] <<~"
	@echo
	@bash -c $(DOT_SCRIPTS)/install.sh
