#!/usr/bin/env bash

# -------------------------------------------------------------------------
#
# Configuration
#
# -------------------------------------------------------------------------
GIT_ARCHIVE_ROOT="super-bash-bros-master"
INSTALLATION_DIR="${HOME}/.super-bash-bros"
EXIT_FAILURE=1

# -------------------------------------------------------------------------
#
# Functions
#
# -------------------------------------------------------------------------
cleanup ()
{
  rm -rf "${STAGING_DIR}"
}

abort ()
{
  [[ -n "${1}" ]] && echo "${1}"
  cleanup
  exit "${EXIT_FAILURE}"
}

# -------------------------------------------------------------------------
#
# Setup
#
# -------------------------------------------------------------------------

# Temp directory to unzip project archive
if ! STAGING_DIR=$(mktemp -d)
then
  echo "Unable to create temp directory for staging.  Aborting installation."
  exit "${EXIT_FAILURE}"
fi

# Temp file for project archive zip
SUPER_BASH_ARCHIVE="$(mktemp).zip" || abort "Unable to create temp file for project archive.  Aborting installation."

# Determine target shell
default_shell=$(dscl . -read ~/ UserShell | awk '{print $2}')
case "${default_shell}" in
  *bash)
    profile=~/.bash_profile
    ;;
  *zsh)
    profile=~/.zshrc
    ;;
  *)
    abort "Aborting installation!  Only Bash and Z shell supported."
    ;;
esac

# Sanity check to ensure profile exists and is writable
[[ ! -e "${profile}" ]] && touch "${profile}"
[[ ! -w "${profile}" ]] && abort "Profile ${profile} not writable"

# -------------------------------------------------------------------------
#
# Install
#
# -------------------------------------------------------------------------

pushd . > /dev/null
cd "${STAGING_DIR}" || exit "${EXIT_FAILURE}"

# Download master, unpack, and copy to destination
curl -sS "https://codeload.github.com/sklampo/shell/zip/master" -o "${SUPER_BASH_ARCHIVE}"
unzip -q "${SUPER_BASH_ARCHIVE}" || abort "Error encountered unpacking shell archive"
cd "${GIT_ARCHIVE_ROOT}" || abort "Unable to descend into root of archive"
find . -print -depth | cpio -pdum --quiet "${INSTALLATION_DIR}"

# -------------------------------------------------------------------------
#
# Configuration
#
# -------------------------------------------------------------------------

# Set up shell library upon login
cat <<'EOF' >> "${profile}"
test -e "${HOME}/.super-bash-bros/shell/index.sh" && source "${HOME}/.super-bash-bros/shell/index.sh"
EOF

# -------------------------------------------------------------------------
#
# Cleanup and success notice
#
# -------------------------------------------------------------------------
# shellcheck disable=SC2164
popd > /dev/null
cleanup

# Off to the races
cat << EOF

Setup complete.  ${profile} updated.

Super Bash library will be available upon next login.  To begin using now, run:

    source ${profile}

EOF
