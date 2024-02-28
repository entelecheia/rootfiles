#!/bin/bash

# ARG_OPTIONAL_REPEATED([variant],[v],[The variant of the test to run. Possible values: devcontainer, wsl, and gnome. Default: devcontainer.],[])
# ARG_OPTIONAL_REPEATED([os],[o],[The OS to run the tests against. The list of possible values can be found at https://mcr.microsoft.com/v2/devcontainers/base/tags/list. Examples: ubuntu-18.04, ubuntu-22.04, and alpine. Default: ubuntu-20.04.],[])
# ARG_OPTIONAL_BOOLEAN([debug],[d],[Whether to enable debug logs or not],[off])
# ARG_OPTIONAL_SINGLE([pre-script],[],[The custom script to run before the installation],[])
# ARG_HELP([Tests the installation of the dotfiles in differents scenarios],[])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

die() {
  local _ret="${2:-1}"
  test "${_PRINT_HELP:-no}" = yes && print_help >&2
  echo "$1" >&2
  exit "${_ret}"
}

begins_with_short_option() {
  local first_option all_short_options='vodh'
  first_option="${1:0:1}"
  test "${all_short_options}" = "${all_short_options/${first_option}/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_variant=()
_arg_os=()
_arg_debug="off"
_arg_pre_script=

print_help() {
  printf '%s\n' "Tests the installation of the dotfiles in differents scenarios"
  printf 'Usage: %s [-v|--variant <arg>] [-o|--os <arg>] [-d|--(no-)debug] [--pre-script <arg>] [-h|--help]\n' "$0"
  printf '\t%s\n' "-v, --variant: The variant of the test to run. Possible values: devcontainer, wsl, and gnome. Default: devcontainer. (empty by default)"
  printf '\t%s\n' "-o, --os: The OS to run the tests against. The list of possible values can be found at https://mcr.microsoft.com/v2/devcontainers/base/tags/list. Examples: ubuntu-18.04, ubuntu-22.04, and alpine. Default: ubuntu-20.04. (empty by default)"
  printf '\t%s\n' "-d, --debug, --no-debug: Whether to enable debug logs or not (on by default)"
  printf '\t%s\n' "--pre-script: The custom script to run before the installation (no default)"
  printf '\t%s\n' "-h, --help: Prints help"
}

parse_commandline() {
  while test $# -gt 0; do
    _key="$1"
    case "${_key}" in
    -v | --variant)
      test $# -lt 2 && die "Missing value for the optional argument '${_key}'." 1
      _arg_variant+=("$2")
      shift
      ;;
    --variant=*)
      _arg_variant+=("${_key##--variant=}")
      ;;
    -v*)
      _arg_variant+=("${_key##-v}")
      ;;
    -o | --os)
      test $# -lt 2 && die "Missing value for the optional argument '${_key}'." 1
      _arg_os+=("$2")
      shift
      ;;
    --os=*)
      _arg_os+=("${_key##--os=}")
      ;;
    -o*)
      _arg_os+=("${_key##-o}")
      ;;
    -d | --no-debug | --debug)
      _arg_debug="on"
      test "${1:0:5}" = "--no-" && _arg_debug="off"
      ;;
    -d*)
      _arg_debug="on"
      _next="${_key##-d}"
      if test -n "${_next}" -a "${_next}" != "${_key}"; then
        { begins_with_short_option "${_next}" && shift && set -- "-d" "-${_next}" "$@"; } || die "The short option '${_key}' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
      fi
      ;;
    --pre-script)
      test $# -lt 2 && die "Missing value for the optional argument '${_key}'." 1
      _arg_pre_script="$2"
      shift
      ;;
    --pre-script=*)
      _arg_pre_script="${_key##--pre-script=}"
      ;;
    -h | --help)
      print_help
      exit 0
      ;;
    -h*)
      print_help
      exit 0
      ;;
    *)
      _PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
      ;;
    esac
    shift
  done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

cmd() {
  echo "==>" "$@"
  "$@"
}

run_test() {
  local -r os="$1"
  local -r setup_script="$2"

  cmd time docker run --rm --init --interactive --user root \
    --env TERM --env COLORTERM \
    --volume "${rootfiles_root}:/root/.rootfiles:ro" \
    "mcr.microsoft.com/devcontainers/base:${os}" \
    bash <<EOF
set -euxo pipefail

${_arg_pre_script}

${setup_script}

if [[ "${debug}" == "on" ]]; then
  export DOTFILES_DEBUG=true
fi

export DOTFILES_TEST=true
echo 'Defaults env_keep += "DOTFILES_TEST"' | sudo tee /etc/sudoers.d/env_keep
sudo usermod -aG sudo vscode

~/.dotfiles/scripts/install_rootmoi.sh

~/.local/bin/chezmoi data
EOF
}

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
rootfiles_root="$(realpath "${script_dir}/..")"

debug="${_arg_debug}"
variants=("${_arg_variant[@]}")
if ((${#variants[@]} == 0)); then
  variants=("devcontainer")
fi
oses=("${_arg_os[@]}")
if ((${#oses[@]} == 0)); then
  oses=("ubuntu-20.04")
fi

for variant in "${variants[@]}"; do
  for os in "${oses[@]}"; do
    echo "Testing variant '${variant}' with OS '${os}'"

    case "${variant}" in
    devcontainer)
      run_test "${os}" "export REMOTE_CONTAINERS=true"
      ;;

    wsl)
      run_test "${os}" "$(
        # shellcheck disable=SC2312
        cat <<'EOF'
export IS_WSL=true

cat <<'EOM' | sudo tee /usr/local/bin/wslpath
#!/bin/bash

sudo mkdir -p /mnt/c/Users/Hello
echo "/mnt/c/Users/Hello"
EOM

sudo chmod +x /usr/local/bin/wslpath

cat <<'EOM' | sudo tee /usr/local/bin/wslvar
#!/bin/bash

echo "Hello"
EOM

sudo chmod +x /usr/local/bin/wslvar

EOF
      )"
      ;;

    gnome)
      run_test "${os}" "$(
        # shellcheck disable=SC2312
        cat <<'EOF'
sudo apt update --yes -qq -o=Dpkg::Use-Pty=0
sudo apt install --yes -qq -o=Dpkg::Use-Pty=0 --no-install-recommends gnome-shell
EOF
      )"
      ;;

    \
      *)
      echo "Variant '${variant}' not supported." >&2
      exit 1
      ;;
    esac
  done
done

# ] <-- needed because of Argbash
