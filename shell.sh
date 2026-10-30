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
  git add -N . && git diff HEAD "$@"
}

gdrop() {
  git add -N . && git diff HEAD --stat
  printf "Discard all of this? [y/N] "
  read -r ans
  [ "$ans" = "y" ] || return
  git reset -q && git restore . && git clean -fd
}

# Same project list as nvim's <leader>p: read from ~/.config/nvim/lua/config/local.lua
_hp_projects() {
  nvim --clean -l <(cat <<'LUA'
local ok, c = pcall(dofile, vim.fn.expand("~/.config/nvim/lua/config/local.lua"))
if not ok or type(c) ~= "table" then c = {} end
local out = {}
for _, root in ipairs(c.project_roots or {}) do
  for _, d in ipairs(vim.fn.globpath(vim.fn.expand(root), "*/", false, true)) do
    table.insert(out, vim.fn.fnamemodify((d:gsub("/$", "")), ":~"))
  end
end
table.insert(out, "~/.config/nvim")
for _, d in ipairs(c.projects or {}) do table.insert(out, d) end
io.write(table.concat(out, "\n"), "\n")
LUA
)
}

hp() {
  local dir name id
  dir=$(_hp_projects | fzf --prompt="project> ") || return
  dir=${dir/#\~/$HOME}
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
