#!/bin/bash

# 设置 dotfiles 的路径
# DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

# # 创建符号链接
# ln -sf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"



# 确保 shell 使用新的配置
# source "$HOME/.bashrc"

echo "配置文件已成功部署！"
#!/bin/bash

# 通过符号链接安装所有配置文件
ln -sf ~/codehome/tmp/missing/5/dotfiles/.bashrc ~/.bashrc
# # 如果有其他配置文件，按同样的方法继续添加

# echo "配置文件安装完成！"

