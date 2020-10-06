source_index ()
{
  SOURCE_ROOT=$1

  if [[ -e ${SOURCE_ROOT} ]] && [[ -d ${SOURCE_ROOT} ]] && [[ -f ${SOURCE_ROOT}/index.sh ]]
  then
      source ${SOURCE_ROOT}/index.sh
  fi
}

SCRIPTS_ROOT=$(dirname $BASH_SOURCE)
source ${SCRIPTS_ROOT}/lib/core.sh

[[ $0 == $BASH_SOURCE ]] && only_sourcing_allowed

ALIASES_ROOT=${SCRIPTS_ROOT}/aliases
FUNCTIONS_ROOT=${SCRIPTS_ROOT}/functions

source_index ${ALIASES_ROOT}
source_index ${FUNCTIONS_ROOT}
