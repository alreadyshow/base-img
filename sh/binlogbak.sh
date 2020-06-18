#!/bin/bash
export LANG=en_US.UTF-8
BIN_DIR="/usr/bin"
BakDir=/dbbackup/mysql/daily
BinDir=/var/log/bs/mysql/logbin
LogFile=/dbbackup/mysql/daily/binlog.log
BinFile=/var/log/bs/mysql/logbin/logbin.index
echo `date +"%Y%m%d %H:%M:%S"` add backup start ! >> $LogFile
$BIN_DIR/mysqladmin -uroot -pSUGH@xk_dsjk2019V5 flush-logs
echo "flush-logs binlog file such" >> $LogFile
#这个是用于产生新的mysql-bin.00000*文件
Counter=`wc -l $BinFile |awk '{print $1}'`
NextNum=0
#这个for循环用于比对$Counter,$NextNum这两个值来确定文件是不是存在或最新的。
for file in `cat $BinFile`
do
 base=`basename $file`
 NextNum=`expr $NextNum + 1`
if [ $NextNum -eq $Counter ] 
then
   echo $base current flush-logs file no backup >> $LogFile
else
  dest=$BakDir/$base
if ( test -e $dest )
then
     echo $base have backup >> $LogFile
else
     cp $BinDir/$base $BakDir
     echo $base backup.. >> $LogFile
fi
fi
done
echo `date +"%Y%m%d %H:%M:%S"` add file backup succ ! >> $LogFile
echo `` >> $LogFile
echo `` >> $LogFile
