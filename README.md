dupro
=====

# Dummy Project Framework (for Korn Shell projects)

This project aims at creating a Korn shell scripting environment which should be portable between Linux, HP-UX, Solaris and AIX.
Each OS can have its own directory tree as we can see with the following dump command:

````
$ sudo opt/dupro/bin/dupro -v dump
dupro 1.0 / Git
Using log file: /home/gdhaese1/projects/dupro/var/opt/dupro/log/dupro-32259-LOGFILE.log
Dumping out configuration and system information
This is a 'Linux-x86_64' system, compatible with 'Linux-i386'.
System definition:
                                    ARCH = Linux-i386
                                      OS = GNU/Linux
                        OS_MASTER_VENDOR =
                       OS_MASTER_VERSION =
                   OS_MASTER_VENDOR_ARCH =
                OS_MASTER_VENDOR_VERSION =
           OS_MASTER_VENDOR_VERSION_ARCH =
                               OS_VENDOR = suse
                              OS_VERSION = 11
                          OS_VENDOR_ARCH = suse/x86_64
                       OS_VENDOR_VERSION = suse/11
                  OS_VENDOR_VERSION_ARCH = suse/11/x86_64
Configuration tree:
                         Linux-i386.conf : missing/empty
                          GNU/Linux.conf : missing/empty
                               suse.conf : missing/empty
                        suse/x86_64.conf : missing/empty
                            suse/11.conf : missing/empty
                     suse/11/x86_64.conf : missing/empty
                               site.conf : missing/empty
                              local.conf : OK

````

Each OS can have its own configuration files as well (be careful the configuration file should be treated as shell scripts as these are sourced by the main script).

The help command shows the existing commands know by dupro:

````
$ sudo opt/dupro/bin/dupro -h
Usage: dupro [-dDsSvV] [-c DIR ] COMMAND [-- ARGS...]

dupro comes with ABSOLUTELY NO WARRANTY; for details see
the GNU General Public License at: http://www.gnu.org/licenses/gpl.html

Available options:
 -c DIR       alternative config directory; instead of /etc/opt/dupro
 -d           debug mode; log debug messages
 -D           debugscript mode; log every function call
 -s           simulation mode; show what scripts dupro would include
 -S           step-by-step mode; acknowledge each script individually
 -v           verbose mode; show more output
 -V           version information

List of commands:
 clean           cleanup the LOG [/home/gdha/projects/dupro/var/opt/dupro/log] directory
 dump            dump configuration and system information

````


