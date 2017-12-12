#!/bin/bash

datum=`date "+%Y-%m-%d_%H.%M.%S"`
output="bot.$datum.log"

bot()
{
	BEURT=$1
	read -p "(U): " ANS
	if [ "$ANS" = 'stop' ]; then exit 0; fi
	echo "U: $BEURT: ${ANS}" >> $output
	pb talk ${ANS} > ANS.bot
	echo "(B): \c"
	cat ANS.bot
	echo "B: $BEURT: \c" >> $output
	cat ANS.bot >> $output
	BEURT=$(($BEURT+1))
	bot $BEURT
}
date > $output
bot 1

exit 0
