#!/bin/bash

# Setup
STAGING_DIR=$(mktemp -d)
SUPER_BASH_ARCHIVE="$(mktemp).zip"
GIT_ARCHIVE_ROOT="shell-master/"
INSTALLATION_DIR="${HOME}/.super_bash_bros2"
EXIT_FAILURE=1

pushd . > /dev/null
cd "${STAGING_DIR}" || exit "${EXIT_FAILURE}"

# Download master, unpack, and copy to installation directory
curl https://codeload.github.com/sklampo/shell/zip/master -o "${SUPER_BASH_ARCHIVE}"
unzip "${SUPER_BASH_ARCHIVE}"
cd "${GIT_ARCHIVE_ROOT}" || exit "${EXIT_FAILURE}"
find . -print -depth | cpio -pdumv "${INSTALLATION_DIR}"

# Set up shell library upon login
cat <<'EOF' >> ~/.bash_profile
test -e "${HOME}/.super_bash_bros2/bash/index.sh" && source "${HOME}/.super_bash_bros2/bash/index.sh"
EOF

# Cleanup
popd . > /dev/null
rm -rf "${STAGING_DIR}"
