#!/bin/bash
#
# yahoo stock info plugin
# much simpler than stock plugin, no API key required
# by http://srinivas.gs


echo -n "FB:"; curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=fb&f=l1' | xargs printf "%.2f\n"
#echo -n "AAPL:"; curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=aapl&f=l1'

