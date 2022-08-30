git config --global user.name "wang95"
git config --global user.email "wang95@vip.qq.com"
git config --global color.ui true
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.sw switch
git config --global alias.unstage 'reset HEAD'
git config --global alias.last 'log -1'
git config --global alias.lg "log --color --graph --date=format:'%Y-%m-%d %H:%M' --pretty=tformat:'%C(red)%h %C(green)%cd%C(auto)%d%Creset %s %C(blue)<%an>%Creset' --abbrev-commit"
# git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# github.com 代理
git config --global http.https://github.com.proxy socks5://127.0.0.1:7890
git config --global https.https://github.com.proxy socks5://127.0.0.1:7890
