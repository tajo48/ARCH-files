#!/bin/bash



#if test -n $(pgrep -f ssend.sh);
#then
sudo kill -9 $(pgrep -f ssend.sh)
#fi

sh /home/tajo48/ARCH-files/ssend.sh
