#!/bin/bash
export LANG=en_US.UTF-8

source /usr/local/sh/binlogbak.sh

BIN_DIR="/usr/bin"
BakDir=/dbbackup/daishu_dump/health
AddBakDir=/dbbackup/daishu_dump/daily
LogFile=/dbbackup/daishu_dump/health/health_bak.log
Date=`date +%Y%m%d_%H%M%S`
Begin=`date +"%Y%m%d %H:%M:%S"`
DB_NAME="health"
DB_USER="root"
DB_PASS="SUGH@xk_dsjk2019V5"
cd $BakDir
DumpFile="/dbbackup/daishu_dump/health/data_"$Date.sql
GZDumpFile="/dbbackup/daishu_dump/health/data_"$Date.sql.tgz
$BIN_DIR/mysqldump -u$DB_USER -p$DB_PASS $DB_NAME --flush-logs --delete-master-logs --single-transaction > $DumpFile
tar -czPf $GZDumpFile $DumpFile
rm $DumpFile
count=$(ls -l *.tgz |wc -l)
if [ $count -ge 5 ]
then
file=$(ls -l *.tgz |awk '{print $9}'|awk 'NR==1')
rm -f $file
fi
#save history number 4

Last=`date +"%Y%m%d %H:%M:%S"`
echo start:$Begin end:$Last $GZDumpFile full backup succ >> $LogFile
mkdir daily_$Date
cp -rf $AddBakDir $BakDir/daily_$Date
echo `date +%Y%m%d_%H%M%S` copy previous add backup  >> $LogFile
cd $AddBakDir
rm -f *
echo `date +%Y%m%d_%H%M%S` delete previous add backup >> $LogFile
cd $BakDir
nums=$(find -name daily_\* -type d|wc -l)
if [ $nums -ge 5 ]
then
file1=$(find -name daily_\* -type d|sort|awk '{print $1}'|awk 'NR==1')
file2=`basename $file1`
rm -rf $file2
fi
echo `date +%Y%m%d_%H%M%S` save 4 quartic add backup >> $LogFile

echo `` >> $LogFile
echo `` >> $LogFile
