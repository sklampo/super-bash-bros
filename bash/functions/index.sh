# shellcheck shell=bash

INVOCATION_SOURCE=${BASH_SOURCE[0]}
DIRNAME=$(dirname "${INVOCATION_SOURCE}")

# shellcheck source=/bash/lib/core.sh
source "${DIRNAME}/../lib/core.sh"
(return 0 2>/dev/null) || only_sourcing_allowed

source_collection "${INVOCATION_SOURCE}"
