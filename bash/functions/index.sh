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

BASENAME=$(basename $BASH_SOURCE)
DIRNAME=$(dirname $BASH_SOURCE)

# Set up aliases
for function_script in $(find ${DIRNAME} -type f ! -name ${BASENAME})
do
    source ${function_script}
done
