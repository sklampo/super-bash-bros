no_direct_invocation_message ()
{
  echo "This script can only be sourced, e.g. . $0, or source $0"
}

only_sourcing_allowed ()
{
  no_direct_invocation_message
  exit 1
}
