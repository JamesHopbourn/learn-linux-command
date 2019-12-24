filename=`ls -t ~/Downloads|head -n1|awk '{print $0}'`;mv -f ~/Downloads/$filename ~/Desktop/learn-linux-command/learn-linux-command.png;pbpaste > learn-linux-command.txt;git add -A;gcsm 'reedit';git push


#pbcopy < learn-linux-command.txt
