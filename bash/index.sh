no_direct_invocation_message ()
{
  echo "This script can only be sourced, e.g. . $0, or source $0"
}

only_sourcing_allowed ()
{
  no_direct_invocation_message
  exit 1
}

source_index ()
{
  SOURCE_ROOT=$1

  if [[ -e ${SOURCE_ROOT} ]] && [[ -d ${SOURCE_ROOT} ]] && [[ -f ${SOURCE_ROOT}/index.sh ]]
  then
      source ${SOURCE_ROOT}/index.sh
  fi
}

[[ $0 == $BASH_SOURCE ]] && only_sourcing_allowed

SCRIPTS_ROOT=$(dirname $BASH_SOURCE)

ALIASES_ROOT=${SCRIPTS_ROOT}/aliases
FUNCTIONS_ROOT=${SCRIPTS_ROOT}/functions

source_index ${ALIASES_ROOT}
source_index ${FUNCTIONS_ROOT}
