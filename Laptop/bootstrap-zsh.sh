# Install ZSH
apt-get update
apt-get install -y zsh

# Configure ZSH 
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://gist.github.com/xfanwu/18fd7c24360c68bab884 /root/xxf
mv /root/xxf/xxf.zsh-theme /root/.oh-my-zsh/themes
chsh -s `which zsh`

# Configure .zsdrc
touch /root/.zshrc
echo 'export ZSH=/root/.oh-my-zsh' >> /root/.zshrc
echo 'ZSH_THEME="xxf"' >> /root/.zshrc
echo 'plugins=(kubectl terraform pip docker git vagrant)' >> /root/.zshrc
echo 'source /root/.oh-my-zsh/oh-my-zsh.sh' >> /root/.zshrc

# end
