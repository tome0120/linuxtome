#!/bin/bash

file="/etc/php/*/apache2/php.ini"

ricerca="dysplay_errors = Off"
sostituzione="display_errors = Off"

ricerca2="max_execution_time = 30"
sostituzione2="max_execution_time = 180"

ricerca3="max_input_time = 60"
sostituzione3="max_input_time = 180"

ricerca4="max_input_vars = 1000"
sostituzione4="max_input_vars = 5000"

ricerca5="memory_limit = 128M"
sostituzione5="memory_limit = 512M"

ricerca6="post_max_size = 8M"
sostituzione6="post_max_size = 32M"

ricerca7="session.gc_maxlifetime = 1440"
sostituzione7="session.gc_maxlifetime = 1440"

ricerca8="upload_max_filesize = 2M"
sostituzione8="upload_max_filesize = 32M"

ricerca9="zlib.output_compression = Off"
sostituzione9="zlib.output_compression = On"

sed -i "s/$ricerca/$sostituzione/g" "$file"
sed -i "s/$ricerca2/$sostituzione2/g" "$file"
sed -i "s/$ricerca3/$sostituzione3/g" "$file"
sed -i "s/$ricerca4/$sostituzione4/g" "$file"
sed -i "s/$ricerca5/$sostituzione5/g" "$file"
sed -i "s/$ricerca6/$sostituzione6/g" "$file"
sed -i "s/$ricerca7/$sostituzione7/g" "$file"
sed -i "s/$ricerca8/$sostituzione8/g" "$file"
sed -i "s/$ricerca9/$sostituzione9/g" "$file"
