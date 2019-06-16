#!/bin/sh

# edit these to match your directory structure
homedir=/home/pennmush
archivedir=game/backup
files=$homedir/backup/files.txt

# customize your archive filename here if you like
filename=game-archive
year=`date +%Y`
date=`date +%m%d`
time=`date +%H%M%S`

backup="$filename.$year.$date.$time.tar.bz2"

cd $homedir

# create the backup
mkdir -p $homedir/$archivedir
tar cjf $homedir/$archivedir/$backup -T $files 2> /dev/null

# to save space, delete other backups more than 14 days old
find $homedir/$archivedir -type f -mtime +14 -delete
