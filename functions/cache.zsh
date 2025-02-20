_nx_caching_policy() {
  local workspace_root=$(_workspace_root)
  local cwd_id=$(echo $workspace_root | (command -v md5sum &> /dev/null && md5sum || md5 -r) | awk '{print $1}')
  local hash_file="/tmp/nx-completion-${cwd_id}.md5"

  if [[ ! -f "$cache_file" || ! -f "$hash_file" ]]; then
    return 1
  fi

  local current_hash=$(md5sum "$(_workspace_root)" | awk '{print $1}')

  local stored_hash
  stored_hash=$(<"$hash_file")

  if [[ "$current_hash" != "$stored_hash" ]]; then
    return 1
  fi

  return 0
}
