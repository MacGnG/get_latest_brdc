#!/bin/bash
## MacGnG - get_latest_brdc
## https://github.com/MacGnG/get_latest_brdc/edit/main/README.md
##
##
## sample command for gps-sdr-sim (8bit and static location)
## gps-sdr-sim -b 8 -e brdc1330.22n -l 39.087822,-94.577656,100
## GPS coords for somewhere in Kansas City
##
## (May-13-2022 is 133 day of the year 2022)
##   ftp://gssc.esa.int/gnss/data/daily/2022/133/brdc1330.22n.gz
##
##
## download format is "ftp://gssc.esa.int/gnss/data/daily/20YY/DDD/brdcDDD0.YYn.gz"
##
## YY			= Current 2-digit Year
## DDD			= Current Day of year (001..366)
## latest_brdc	= Format the latest daily brdc file name
## download		= Format the FTP url 
## wget -4		= wget will connect only to IPv4 addresses
## gunzip -q -k	= gunzip (.gz UnZip) quiet mode & keep the source
##
##
YY=$(date +%y)
DDD=$(date +%j)
latest_brdc="brdc${DDD}0.${YY}n"
download="ftp://gssc.esa.int/gnss/data/daily/20${YY}/${DDD}/${latest_brdc}.gz"
wget -4 "${download}"
gunzip -q -k "${latest_brdc}.gz"
