#!/bin/sh

if [ ! -f /config/GeoIP.conf ]; then
  echo "GeoIP config file is missing, installing dummy"
  cp /geoipupdate/GeoIP.conf /config
else
  grep -q "^AccountID YOUR_ACCOUNT_ID_HERE$" /config/GeoIP.conf
  if [ ${?} -eq 0 ]; then
    echo "Please edit the GeoIP.conf file"
    exit 1
  else
    echo "Updating GeoIP information"
    /geoipupdate/geoipupdate -f /config/GeoIP.conf
  fi
fi

if [ ! -f /config/parsedmarc.ini ]; then
  echo "parsedmarc.ini file is missing, installing dummy"
  cp /parsedmarc.ini /config
else
  grep -q REMOVE_THIS_LINE /config/parsedmarc.ini
  if [ ${?} -eq 0 ]; then
    echo "Please edit the parsedmarc.ini file to your liking"
    exit 1
  else
    parsedmarc -c /config/parsedmarc.ini
  fi
fi