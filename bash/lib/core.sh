# shellcheck shell=bash

no_direct_invocation_message ()
{
  echo "This script can only be sourced, e.g. . $0, or source $0"
}

only_sourcing_allowed ()
{
  no_direct_invocation_message
  exit 1
}

source_collection ()
{
  SOURCE="$1"
  BASENAME=$(basename "${SOURCE}")
  DIRNAME=$(dirname "${SOURCE}")

  while IFS= read -r -d '' script
  do
    # shellcheck disable=SC1090
    source "${script}"
  done < <(find "${DIRNAME}" -type f \! -name "${BASENAME}" \! -name "README.md" -print0)
}
