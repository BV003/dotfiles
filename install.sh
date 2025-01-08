#!/bin/bash

# 通过符号链接安装所有配置文件
ln -sf ~/dotfiles/.bashrc ~/.bashrc
# 如果有其他配置文件，按同样的方法继续添加
# ln -sf ~/dotfiles/.vimrc ~/.vimrc

echo "配置文件安装完成！"

