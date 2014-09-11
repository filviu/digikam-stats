digikam-stats
=============

Bash script showing digikam camera and lenses statistics.


Why?
====

I wanted to see which focal length made the most sense to buy a prime
lens for.


Limitations
===========

* Only mysql database support for now
* Lenses statistics is only useful if you have a camera with
interchangable lenses


Usage
=====

Edit digikam-stats.sh and set the following variables:

DBHOST - mysql server hostname where the digikam database is stored
(usually localhost) 
DBUSER - mysql username that has SELECT privileges on the digikam
database 
DBPASS - password for the mysql username
DBNAME - name of the digikam database, usually digikam


digikam_stats.sh [cameras|lenses|help] 
digikam_stats.sh [lenses "model"] 

 help - shows this simple usage help text
 cameras - show statistics regarding cameras used
 lenses - show statistics regarding lens usage
 model - limit lenses output to only one model of camera, use quotes!


Examples
========

digikam_stats.sh cameras

produces a text table list of cameras sorted by number of images

digikam_stats.sh lenses

produces a list of the number of images shot at each focal length by each camera in the database

digikam_stats.sh lenses "Canon EOS 50D" 

produces the same list as above but limited to only one camera model

IMO the most useful feature. Use cameras to see the models in your
database and limit the search per camera. This way you exclude compacts,
phones, etc. and only see the results for your DSLR
