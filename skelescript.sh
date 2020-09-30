#!/bin/bash

script_name=$1

echo "#!/bin/bash" >> $script_name # dont overwrite if it already exists
echo >> $script_name
echo >> $script_name

chmod +x $script_name

vim $script_name
