#!/bin/sh
exec 2>&1
cd /setup/scripts
for script in [0-9][0-9][0-9]*.sh
do
    echo "===================================================================="
    echo "== Executing script: ${script}"
    echo "===================================================================="
    . ./"${script}";
done
cd -
