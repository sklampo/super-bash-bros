# shellcheck shell=bash

source_index ()
{
  SOURCE_ROOT=$1

  if [[ -e "${SOURCE_ROOT}" ]] && [[ -d "${SOURCE_ROOT}" ]] && [[ -f "${SOURCE_ROOT}/index.sh" ]]
  then
      # shellcheck source=/bash/index.sh
      source "${SOURCE_ROOT}/index.sh"
  fi
}

SCRIPTS_ROOT=$(dirname "${BASH_SOURCE[0]}")
# shellcheck source=/bash/lib/core.sh
source "${SCRIPTS_ROOT}/lib/core.sh"

(return 0 2>/dev/null) || only_sourcing_allowed

ALIASES_ROOT="${SCRIPTS_ROOT}/aliases"
FUNCTIONS_ROOT="${SCRIPTS_ROOT}/functions"

source_index "${ALIASES_ROOT}"
source_index "${FUNCTIONS_ROOT}"
