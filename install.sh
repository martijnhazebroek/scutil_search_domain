#/bin/bash

curl -fsSL -o /var/tmp/scutil_install.sh https://raw.githubusercontent.com/martijnhazebroek/scutil_search_domain/master/configure_search_domain.sh
sh /var/tmp/scutil_install.sh your.domain.tld
rm /var/tmp/scutil_install.sh