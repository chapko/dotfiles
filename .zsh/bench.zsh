#!/usr/bin/env zsh
#
zmodload zsh/datetime

RUNS=50
CACHE_DIR="${TMPDIR:-/tmp}/comp-bench"
mkdir -p "$CACHE_DIR"

compdef() { :; }   # stub so sourcing completions doesn't error without compinit

# ---- gh ----
gh_cached() {
  local version="${$(gh --version)[(w)3]}"
  local file="$CACHE_DIR/gh@${version}.completion.zsh"
  [[ -f "$file" ]] || touch "$file"
}
gh_direct() {
  gh completion -s zsh > /dev/null
}

# ---- uv ----
uv_cached() {
  local version="${$(uv --version)[(w)2]}"
  local file="$CACHE_DIR/uv@${version}.completion.zsh"
  [[ -f "$file" ]] || touch "$file"
}
uv_direct() {
  uv generate-shell-completion zsh > /dev/null
}

# ---- pnpm ----
pnpm_cached() {
  local file="$CACHE_DIR/pnpm@$(pnpm -v).completion.zsh"
  [[ -f "$file" ]] || touch "$file"
}
pnpm_direct() {
  pnpm completion zsh > /dev/null
}

# ---- mise ----
mise_cached() {
  local version="${$(mise version)[(w)1]}"
  local file="$CACHE_DIR/mise@${version}.completion.zsh"
  [[ -f "$file" ]] || touch "$file"
}
mise_direct() {
  mise activate zsh > /dev/null
}

# ---- zoxide ----
zoxide_cached() {
  local version="${$(zoxide --version)[(w)2]}"
  local file="$CACHE_DIR/zoxide@${version}.completion.zsh"
  [[ -f "$file" ]] || touch "$file"
}
zoxide_direct() {
  zoxide init zsh --cmd z --hook pwd > /dev/null
}

# ---- list of tests: add new ones here ----
tests=(
  gh_direct
  gh_cached
  uv_direct
  uv_cached
  pnpm_direct
  pnpm_cached
  mise_direct
  mise_cached
  zoxide_direct
  zoxide_cached
)

for t in $tests; do
  $t >/dev/null 2>&1                      # warmup (also creates the cache file)
  start=$EPOCHREALTIME
  for ((i = 0; i < RUNS; i++)); do
    $t >/dev/null 2>&1
  done
  end=$EPOCHREALTIME
  printf '%-12s %8.2f ms per run\n' $t $(( (end - start) * 1000 / RUNS ))
done
