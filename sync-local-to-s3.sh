#!/bin/bash

#-------------------------------------------------------------------------------
# SCRIPT.........: sync-local-to-s3.sh
# ACTION.........: Sync Local Folder to Amazon S3
# COPYRIGHT......: Christos Pontikis http://www.pontikis.gr
# LICENSE........: MIT https://opensource.org/licenses/MIT
# GITHUB.........: https://github.com/pontikis/sync-local-to-s3
# BITBUCKET......: https://bitbucket.org/pontikis/sync-local-to-s3
#
# EXTERNAL.......: Amazon S3 Tools http://s3tools.org/s3cmd
#                  Optional: trickle bandwidth shaper http://linux.die.net/man/1/trickle
#                  Amazon AWS account required)
#-------------------------------------------------------------------------------

# parameters -------------------------------------------------------------------
cmd_DATE="$(which date)"
cmd_TEE="$(which tee)"
S3CMD="$(which s3cmd)"
cmd_MAIL="$(which mail)"

source $1 || exit

# initialize backup log --------------------------------------------------------
cat /dev/null > $tmpBackupLog

dt=`$cmd_DATE "+%Y-%m-%d %H:%M:%S"`
echo $topseparator 2>&1 | $cmd_TEE -a $tmpBackupLog
echo "$ALIAS started at $dt" 2>&1 | $cmd_TEE -a $tmpBackupLog
echo $separator 2>&1 | $cmd_TEE -a $tmpBackupLog

# sync -------------------------------------------------------------------------
$cmd_TRICKLE $S3CMD sync $S3CMD_PARAMS $S3CMD_CONFIG $SOURCE $DESTINATION 2>&1 | $cmd_TEE -a $tmpBackupLog

# finalize backup log ----------------------------------------------------------
dt=`$cmd_DATE "+%Y-%m-%d %H:%M:%S"`
echo "$ALIAS finished at $dt" 2>&1 | $cmd_TEE -a $tmpBackupLog
echo $separator 2>&1 | $cmd_TEE -a $tmpBackupLog
echo "" >> $tmpBackupLog
cat $tmpBackupLog >> $BackupLog

# send mail report -------------------------------------------------------------
if [ $do_send_mail -eq 1 ]; then $cmd_MAIL -s "$ALIAS" $mail_to  < $tmpBackupLog; fi

# shutdown ---------------------------------------------------------------------
if [ $do_shutdown -eq 1 ]; then cmd_SHUTDOWN; fi