#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

echo
echo '========================= WARNING ========================'
echo 'If you made changes to the files in the `bash-for-devops`'
echo 'directory then your changes will be lost if you continue.'
echo 'Any new files you added to the directory will be deleted.'
echo '=========================================================='
echo
read -p "Continue? (y/n): " -n 1 -r response
echo

case "${response}" in  
  y|Y)
    echo
    echo '========================== INFO =========================='
    echo 'You will see a `No such image` error message below if the'
    echo '`bash-for-devops` Docker image has not yet been created.'
    echo 'This error is expected and can be ignored.'
    echo '=========================================================='
    echo

    unset file_name # script must be run using `source` for this to work

    image_name='bash-for-devops'

    docker image remove \
      --force \
      ${image_name} || true # suppress error

    echo

    git reset --hard HEAD
    
    echo
    ;;
  *)
    echo
    echo 'Action cancelled'
    echo
    ;;
esac

# As this script will be run using `source 0-reset-tutorial.sh` the set
# commands on lines 3-5 will be executed in the shell where the examples
# are being run. As we want the examples to be runnning under default 
# Bash configuration it's necessary to reset to the default shell 
# attributes here so the examples will work correctly.
set +o errexit
set +o nounset
set +o pipefail
