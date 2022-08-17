mv ~/.zshrc ~/.zshrc_backup
cp ./.zshrc ~/.zshrc

# git open
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
#zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

source ~/.zshrc

echo "successful my zsh"
