# shellcheck shell=bash

running_shell=$(ps -o command -p $$ | sed 1d)
[[ "${running_shell}" == "-bash" ]] && INVOCATION_SOURCE=${BASH_SOURCE[0]} || INVOCATION_SOURCE=$0

DIRNAME=$(dirname "${INVOCATION_SOURCE}")

# shellcheck source=/shell/lib/core.sh
source "${DIRNAME}/../lib/core.sh"
(return 0 2>/dev/null) || only_sourcing_allowed

source_collection "${INVOCATION_SOURCE}"
