#!/bin/bash
#
# Simple script printing camera and lenses usage from a digikam MYSQL database
# by silviuvulcan
# http://www.silviuvulcan.ro/ http://www.sgvulcan.com/
#

DBHOST='localhost'
DBUSER='dkuser'
DBPASS='dkpass'
DBNAME='digikam'

DBHOST='localhost'
DBUSER='root'
DBPASS='burningvos4@mys'
DBNAME='digikam1'

USAGE='
`basename $0` [cameras|lenses|help] \n
`basename $0` [lenses "model"] \n
\n
help - shows this simple usage help text\n
cameras - show statistics regarding cameras used\n
lenses - show statistics regarding lens usage\n
model - limit lenses output to only one model of camera, use quotes!\n
'

#SELECT model,focalLength,count(*) FROM `ImageMetadata` where model = 'Canon EOS 50D' group by make,model,focalLength;
#    SQL='SELECT make,model,count(*) FROM `ImageMetadata` where model = "Canon EOS 50D" group by make,model;'

if [ $# -eq 0 ]||[ "$1" == "help" ]; then 
    echo -e $USAGE
    exit 0
fi

if [ $# -eq 1 ]&&[ "$1" != "cameras" ]&&[ "$1" != "lenses" ]; then
    echo -e $USAGE
    exit 0
fi

if [ $# -eq 1 ]&&[ "$1" == "cameras" ]; then
    SQL='SELECT make,model,count(*) FROM `ImageMetadata` group by make,model ORDER BY count(*) DESC;'
    echo $SQL | mysql -t -h $DBHOST -u $DBUSER -p$DBPASS $DBNAME
fi

if [ $# -eq 1 ]&&[ "$1" == "lenses" ]; then
    SQL='SELECT make,model,focalLength,count(*) FROM `ImageMetadata` group by make,model,focalLength ORDER BY count(*) DESC;'
    echo $SQL | mysql -t -h $DBHOST -u $DBUSER -p$DBPASS $DBNAME
fi

if [ $# -eq 2 ]&&[ "$1" == "lenses" ]; then
    SQL='SELECT make,model,focalLength,count(*) FROM `ImageMetadata` WHERE model = "'$2'" GROUP BY make,model,focalLength ORDER BY count(*) DESC;'
    echo $SQL | mysql -t -h $DBHOST -u $DBUSER -p$DBPASS $DBNAME
fi
