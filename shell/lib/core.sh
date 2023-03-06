# shellcheck shell=bash

only_sourcing_allowed ()
{
  echo "This script can only be sourced, e.g. . $0, or source $0"
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
    file -b "${script}" | grep -i text && source "${script}" || echo "Ignoring file ${script}"
  done < <(find "${DIRNAME}" -type f \! -name "${BASENAME}" \! -name "README.md" -maxdepth 1 -print0)
}
