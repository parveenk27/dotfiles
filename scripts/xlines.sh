#!/usr/bin/env bash
set -euo pipefail

function usage() {
  printf "%s\n" "Usage: ${0} OPTIONS COMMAND arguments"
  printf "%s\t\t%s\n" "-h" "Show help"
  printf "%s\t%s\n" "-l number" "Call COMMAND for each number lines. Default 1"
  printf "\n"
  printf "%s\n" "Execute COMMAND for each number lines"
}

function main() {
  local -i line_count=1
  local opt

  while getopts "hl:" opt; do
    case ${opt} in
      h)
        usage
        exit 0
        ;;
      l)
        line_count=${OPTARG}
        ;;
    esac
  done

  shift $((OPTIND-1))

  if [[ ${#} -lt 1 ]]; then
    printf "%s\n\n" "Error: COMMAND is required"
    usage
    exit 1
  fi

  while mapfile -n $line_count arr && ((${#arr[@]})); do
    printf "%s" "${arr[@]}" | "${@}"
  done
}

main "${@}"
