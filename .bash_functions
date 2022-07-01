## Custom functions
## ==============
function passgen () {
  local len="${1}"
  [[ "${len}" == "" ]] && len=25
  tr -cd 0-9A-Za-z_ < /dev/urandom | fold -w"${len}" | head -n5
}
