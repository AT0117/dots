#!/bin/bash
# Returns uptime in "XH YM" format
uptime -p | sed -e 's/up //g' -e 's/ hours,/h/g' -e 's/ minutes/m/g'