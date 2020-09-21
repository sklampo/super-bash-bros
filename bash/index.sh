#!/usr/bin/env bash

no_direct_invocation_message ()
{
  echo "This script can only be sourced, e.g. . $0, or source $0"
}

only_sourcing_allowed ()
{
  no_direct_invocation_message
  exit 1
}

[[ $0 == $BASH_SOURCE ]] && only_sourcing_allowed

SCRIPTS_ROOT=$(dirname $BASH_SOURCE)

ALIASES_ROOT=${SCRIPTS_ROOT}/aliases
FUNCTIONS_ROOT=${SCRIPTS_ROOT}/functions

# Set up aliases
for alias_script in $(find ${ALIASES_ROOT} -type f)
do
    source ${alias_script}
done

# Set up functions
for function_script in $(find ${FUNCTIONS_ROOT} -type f)
do
    source ${function_script}
done
