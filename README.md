# My dotfiles

## gitconfig

git 设置代理

```bash
# 设置全局代理
# http
git config --global https.proxy http://127.0.0.1:7890
# https
git config --global https.proxy https://127.0.0.1:7890
# socks5
git config --global http.proxy socks5://127.0.0.1:7890
git config --global https.proxy socks5://127.0.0.1:7890

# 只对 github.com 使用代理，其他仓库不走代理
git config --global http.https://github.com.proxy socks5://127.0.0.1:7890
git config --global https.https://github.com.proxy socks5://127.0.0.1:7890
# 取消github代理
git config --global --unset http.https://github.com.proxy
git config --global --unset https.https://github.com.proxy

# 取消全局代理
git config --global --unset http.proxy
git config --global --unset https.proxy

```
