{
  if (match($0, /^[[:space:]]*(--[^ ]+)/)) {
    # printf "%s[[%s] %s]\n", $2, arg[1], $3
    printf "%s[]\n", $1
  }
}
