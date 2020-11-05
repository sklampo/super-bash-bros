BASENAME=$(basename $BASH_SOURCE)
DIRNAME=$(dirname $BASH_SOURCE)
. ${DIRNAME}/../lib/core.sh

[[ $0 == $BASH_SOURCE ]] && only_sourcing_allowed

# Set up aliases
for alias_script in $(find ${DIRNAME} -type f ! -name ${BASENAME} ! -name "README.md")
do
    source ${alias_script}
done
