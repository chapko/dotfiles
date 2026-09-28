function l {
  if [[ "$#" -eq 0 ]]; then
    ll $1
    return
  fi

  if [[ "$#" -gt 1 ]]; then
    ll "$@"
    return
  fi


  if [[ "$1" == "-*" ]]; then
    ll $1
    return
  fi

  if [[ -f "$1" ]]; then
    ll --color=always --icons=never "$1" | bat - "$1"
    return
  fi

  ll "$@"
}
