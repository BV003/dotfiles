alias mytest='echo "Haha! How are you"'

gacp() {
  if [ $# -eq 0 ]; then
    local commit_msg="Update"
  else
    local commit_msg="$*"
  fi
  echo "Adding all files..."
  git add .
  echo "Committing changes..."
  git commit -m "$commit_msg"
  echo "Pushing to remote..."
  git push
}

gd() {
  git add -N . && git diff "$@"
}

gdrop() {
  git add -N . && git diff --stat
  printf "Discard all of this? [y/N] "
  read -r ans
  [ "$ans" = "y" ] || return
  git restore . && git reset -q && git clean -fd
}

hp() {
  local dir name id
  dir=$( (ls -d ~/Documents/codehome/*/; echo ~/.config/nvim) | fzf --prompt="project> ") || return
  dir=${dir%/}
  name=$(basename "$dir")
  id=$(herdr workspace list | jq -r --arg n "$name" '.result.workspaces[] | select(.label==$n) | .workspace_id' | head -1)
  if [ -n "$id" ]; then
    herdr workspace focus "$id" >/dev/null
  else
    herdr workspace create --cwd "$dir" --label "$name" --focus >/dev/null
  fi
}

setproxy() {
    export ALL_PROXY="http://127.0.0.1:7897"
    export http_proxy=$ALL_PROXY
    export https_proxy=$ALL_PROXY
    echo "Clash proxy on"
}
unsetproxy() {
    unset ALL_PROXY http_proxy https_proxy
    echo "Proxy off"
}
