all: config zsh tmux, fonts
	

config:
	rm -f $$HOME/.bashrc
	stow --verbose --target=$$HOME --restow */

zsh: ohmyzsh powerlevel10k 

tmux: tmux-tmp tmux-plugins tmux-auto-suggestions tmux-fzf-zsh-plugin

clean:
	stow --verbose --target=$$HOME --delete */
	rm -rf $$HOME/.oh-my-zsh
	rm -rf $$HOME/.tmux/plugins/tpm



ohmyzsh:
	@sh -c "curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --unattended --keep-zshrc"

powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


tmux-tmp:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux-auto-suggestions:
	git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

tmux-fzf-zsh-plugin:
	git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git $${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin

nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz

keyboard-layout:
	keyboard_layouts/set_layout.sh

fonts:
	install_fonts.sh

