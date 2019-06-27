$ !
$ PROGRAM="''P1'"
$ PORT="''P2'"
$ TIMEOUT="''P3'"
$ !
$ if "''PROGRAM'".eqs."" then goto USAGE
$ if "''PORT'".eqs."" then PORT="4444"
$ if "''TIMEOUT'".eqs."" then TIMEOUT="30"
$ !
$ define/user DBG_RMT "-rd ''PORT':''TIMEOUT'"
$ define/user sys$input sys$command
$ !
$ write sys$output "Telnet to port ''PORT' within ''TIMEOUT' seconds..."
$ !
$ run EXE:'PROGRAM
$ !
$ exit
$ !
$ USAGE:
$ write sys$output "Usage: @REMOTE_DEBUG <program> [<port> [<timeout>]]"
$ write sys$output ""
$ write sys$output "  Port defaults to 4444 and timeout to 30"
$ write sys$outout ""
$ exit
