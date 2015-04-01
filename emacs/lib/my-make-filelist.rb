
$EXCLUDE_PATH = %w[
. .. backup lost+found tmp temp
.cache w3mtmp proxy-cache trash proc RCS .git
Caches /System Trash
]

# Exclude regexps (backup files, core files, and so on)
$EXCLUDE_REGEXP = Regexp.union(/~$/, /\#.+\#$/, /[._].*\.swp$/, /core\.\d+$/, # from ack-grep
  /\.(?:elc|o)$/, /,v$/, /^.DS_Store$/, /.*\.class$/, /.*\.pyc/)

$LS_DIRS = [
            "~/"
]
