#!/bin/bash

#!/bin/bash

for folder in
do
    if [ -d "$folder" ]
    then
        echo "Folder exists: $folder"
    else
        echo "Folder missing: $folder"
    fi
done
