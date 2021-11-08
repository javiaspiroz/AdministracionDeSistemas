#!/bin/bash

echo
echo "############################"
echo "Starting apt-get-autoupdater"
date
echo
apt-get update
apt-get --fix-broken install
apt-get --yes upgrade
# apt-get autoremove
# apt-get clean
# apt-get autoclean
exit 0