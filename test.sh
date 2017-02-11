#!/bin/sh

#find . -name "*.sh" -exec shellcheck {} \;

foodcritic cookbooks/ \
-t ~FC001 \
-t ~FC007 \
-t ~FC008 \
-t ~FC064 \
-t ~FC065 \

#chef-client -z -o base
