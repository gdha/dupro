# clean-workflow.sh
#
WORKFLOW_clean_DESCRIPTION="cleanup the LOG [$LOG_DIR] directory"
set -A WORKFLOWS ${WORKFLOWS[@]} "clean"

function WORKFLOW_clean  {
    LogPrint "Cleaning old log files from the LOG directory"

    LogPrint "The following file(s) were deleted from the LOG directory $LOG_DIR :"
    find $LOG_DIR -name "${PROGRAM%.*}-*-LOGFILE.log" -type f -mtime +1 -print -exec rm {} \; >&2

}
