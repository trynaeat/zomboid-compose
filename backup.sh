#!/bin/sh
####################################
#
# Backup script.
#
####################################

# What to backup. 
backup_files="./Zomboid"

# Where to backup to.
dest="./backups"

# Create archive filename.
date=$(date +"%Y-%m-%dT%H:%M:%S")
archive_file="Zomboid-$date.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
