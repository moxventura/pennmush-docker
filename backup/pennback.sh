#!/bin/sh

# edit these to match your directory structure
homedir=/source
archivedir=/target
files=/files.txt

# customize your archive filename here if you like
filename=game-archive
year=`date +%Y`
date=`date +%m%d`
time=`date +%H%M%S`

backup="$filename.$year.$date.$time.tar.bz2"

cd $homedir

# create the backup
mkdir -p $archivedir
tar cjf $archivedir/$backup -T $files 2> /dev/null
echo "`date` Created $backup"
# to save space, delete other backups more than 14 days old
find $archivedir -type f -mtime +14 -delete
