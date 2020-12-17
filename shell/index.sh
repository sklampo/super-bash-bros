# shellcheck shell=bash

source_index ()
{
  SOURCE_ROOT=$1

  if [[ -e "${SOURCE_ROOT}" ]] && [[ -d "${SOURCE_ROOT}" ]] && [[ -f "${SOURCE_ROOT}/index.sh" ]]
  then
      # shellcheck source=/shell/index.sh
      source "${SOURCE_ROOT}/index.sh"
  fi
}

running_shell=$(ps -o command -p $$ | sed 1d)
case "${running_shell}" in
  *bash)
    SCRIPTS_ROOT=$(dirname "${BASH_SOURCE[0]}")
    ;;
  *zsh)
    SCRIPTS_ROOT=$(dirname "${0}")
    ;;
  *)
    echo "Only Bash and Zsh supported"
    exit 1
    ;;
esac

# shellcheck source=/shell/lib/core.sh
source "${SCRIPTS_ROOT}/lib/core.sh"

(return 0 2>/dev/null) || only_sourcing_allowed

ALIASES_ROOT="${SCRIPTS_ROOT}/aliases"
FUNCTIONS_ROOT="${SCRIPTS_ROOT}/functions"

source_index "${ALIASES_ROOT}"
source_index "${FUNCTIONS_ROOT}"
