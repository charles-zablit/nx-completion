# Check if at least one of w_defs are present in working dir.
__check_workspace_def() {
  integer ret=1
  local files=(
    "$PWD/angular.json"
    "$PWD/workspace.json"
    "$PWD/nx.json"
  )
  local nx_root
  
  # return 1 if none of the files are present.
  for f in $files; do
    if [[ -f $f ]]; then
      ret=0
      nx_root=$PWD
      break
    fi
  done

  if [ $ret -eq 1 ]; then
    nx_root=$(git rev-parse --show-toplevel)
    if [ -n "$nx_root" ]; then
      ret=0
    fi
  fi

  # To get all workspace projects and targets nx graph needs to be called to store the
  # data in a file.
  if [[ $ret -eq 0 ]]; then
    tmp_cached_def="$nx_root/.nx/workspace-data/project-graph.json"
  fi

  return ret
}

_workspace_root() {
  integer ret=1
  if [[ -f $tmp_cached_def ]]; then
    echo $tmp_cached_def && ret=0
  fi
  return ret
}
