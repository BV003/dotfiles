# 别名
alias mytest='echo "Haha! How are you"'

# 一键完成 git add, commit 和 push
gacp() {
  # 检查是否提供了提交信息参数
  if [ $# -eq 0 ]; then
    # 如果没有提供，使用默认消息
    local commit_msg="Update"
  else
    # 如果提供了，使用用户输入的消息
    local commit_msg="$*"
  fi
  # 执行 git 命令
  echo "正在添加所有文件..."
  git add .
  echo "正在提交更改..."
  git commit -m "$commit_msg"
  echo "正在推送到远程仓库..."
  git push
}
