

    file_line { 'disable_telnet':
    
        path        => '/etc/inetd.conf',
        match       => '^telnet\ stream\ tcp6\ nowait\ root\ /usr/sbin/tcpd\=',
        line        => "#telnet  stream  tcp6    nowait  root    /usr/sbin/tcpd      telnetd -a",

     }
    file_line { 'disable_telnet_tcpwrapper':
    
        path        => '/etc/inetd.conf',
        match       => '^telnet\ stream\ tcp6\ nowait\ root\ /usr/sbin/telnetd\=',
        line        => "#telnet  stream  tcp6    nowait  root    /usr/sbin/telnetd      telnetd -a",

     }
    file_line { 'disable_telnet_service_tcp':
    
        path        => '/etc/services',
        match       => '^telnet\ 23\tcp=',
        line        => "#telnet                  23/tcp          # Telnet",

     }    
      file_line { 'disable_telnet_service_udp':
    
        path        => '/etc/services',
        match       => '^telnet\ 23\udp=',
        line        => "#telnet                  23/udp          # Telnet",

     }    
    -----------
    ## @(#)62       1.17.3.4  src/tcpip/etc/inetd.conf, tcpinet, tcpip61N, 1024A_61N 5/27/10 21:56:33
## IBM_PROLOG_BEGIN_TAG
## This is an automatically generated prolog.
##
## tcpip61N src/tcpip/etc/inetd.conf 1.17.3.4
##
## Licensed Materials - Property of IBM
##
## COPYRIGHT International Business Machines Corp. 1993,2010
## All Rights Reserved
##
## US Government Users Restricted Rights - Use, duplication or
## disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
##
## IBM_PROLOG_END_TAG
##
## COMPONENT_NAME: TCPIP inetd.conf
##
## FUNCTIONS:
##
## ORIGINS: 26  27
##
## (C) COPYRIGHT International Business Machines Corp. 1993
## All Rights Reserved
## Licensed Materials - Property of IBM
##
## US Government Users Restricted Rights - Use, duplication or
## disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
##
#######################################################################
##
##                 Internet server configuration database
##
##      Services can be added and deleted by deleting or inserting a
##      comment character (ie. #) at the beginning of a line  If inetd
##      is running under SRC control then the "refresh -s inetd" command
##      needs to be executed for inetd to re-read the inetd.conf file.
##
##      NOTE: The TCP/IP servers do not require SRC and may be started
##      by invoking the service directly (i.e. /etc/inetd). If inetd
##      has been invoked directly, after modifying this file, send a
##      hangup signal, SIGHUP to inetd (ie. kill -1 "pid_of_inetd").
##
##      NOTE: The services with socket type of "sunrpc_tcp" and "sunrpc_udp"
##      require that the portmap daemon be running.
##      Also please use ## to designate comments in this file so that
##      the smit commands can edit this file correctly.
##
##      NOTE: When using IPv6 services, specify "tcp6" or "udp6" for the
##      protocol.  "tcp" and "udp" are interpreted as IPv4.
##
## service  socket  protocol  wait/  user    server    server program
##  name     type             nowait         program     arguments
##
#ftp     stream  tcp6    nowait  root    /usr/sbin/ftpd         ftpd
#telnet  stream  tcp6    nowait  root    /usr/sbin/telnetd      telnetd -a
#shell   stream  tcp6    nowait  root    /usr/sbin/rshd         rshd
#kshell  stream  tcp     nowait  root    /usr/sbin/krshd        krshd
#login   stream  tcp6    nowait  root    /usr/sbin/rlogind      rlogind
#klogin  stream  tcp     nowait  root    /usr/sbin/krlogind     krlogind
#exec    stream  tcp6    nowait  root    /usr/sbin/rexecd       rexecd
#comsat dgram   udp     wait    root    /usr/sbin/comsat       comsat
#uucp   stream  tcp     nowait  root    /usr/sbin/uucpd        uucpd
#bootps dgram   udp     wait    root    /usr/sbin/bootpd       bootpd /etc/bootptab
##
## Finger, systat and netstat give out user information which may be
## valuable to potential "system crackers."  Many sites choose to disable
## some or all of these services to improve security.
##
#finger stream  tcp     nowait  nobody  /usr/sbin/fingerd     fingerd
#systat stream  tcp     nowait  nobody  /usr/bin/ps           ps -ef
#netstat stream tcp     nowait  nobody  /usr/bin/netstat      netstat -f inet
#
#tftp    dgram  udp6    SRC     nobody  /usr/sbin/tftpd         tftpd -n
#talk   dgram   udp     wait    root    /usr/sbin/talkd         talkd
#ntalk   dgram   udp     wait    root    /usr/sbin/talkd         talkd
#
# rexd uses very minimal authentication and many sites choose to disable
# this service to improve security.
#
#rquotad  sunrpc_udp     udp     wait    root    /usr/sbin/rpc.rquotad rquotad 100011 1
#rexd    sunrpc_tcp     tcp     wait    root    /usr/sbin/rpc.rexd rexd 100017 1
#rstatd  sunrpc_udp     udp     wait    root    /usr/sbin/rpc.rstatd rstatd 100001 1-3
#rusersd sunrpc_udp     udp     wait    root    /usr/lib/netsvc/rusers/rpc.rusersd rusersd 100002 1-2
#rwalld  sunrpc_udp     udp     wait    root    /usr/lib/netsvc/rwall/rpc.rwalld rwalld 100008 1
#sprayd  sunrpc_udp     udp     wait    root    /usr/lib/netsvc/spray/rpc.sprayd sprayd 100012 1
#pcnfsd  sunrpc_udp     udp     wait    root    /usr/sbin/rpc.pcnfsd pcnfsd 150001 1-2
#echo   stream  tcp     nowait  root    internal
#discard        stream  tcp     nowait  root    internal
#chargen        stream  tcp     nowait  root    internal
#daytime        stream  tcp     nowait  root    internal
#time   stream  tcp     nowait  root    internal
#echo   dgram   udp     wait    root    internal
#discard        dgram   udp     wait    root    internal
#chargen        dgram   udp     wait    root    internal
#daytime        dgram   udp     wait    root    internal
#time   dgram   udp     wait    root    internal
## The following line is for installing over the network.
#instsrv stream tcp     nowait  netinst /u/netinst/bin/instsrv instsrv -r /tmp/netinstalllog /u/netinst/scripts
#imap2  stream  tcp     nowait  root    /usr/sbin/imapd imapd
#pop3   stream  tcp     nowait  root    /usr/sbin/pop3d pop3d
caa_cfg stream  tcp6    nowait  root    /usr/sbin/clusterconf clusterconf >>/var/adm/ras/clusterconf.log 2>&1
wsmserver       stream  tcp     nowait  root    /usr/websm/bin/wsmserver wsmserver -start
#example of the use of tcpwrapper with telnet
#telnet  stream  tcp6    nowait  root    /usr/sbin/tcpd      telnetd -a
xmquery dgram   udp6    wait    root    /usr/bin/xmtopas xmtopas -p3
bgssd stream  tcp  nowait patrol  /etc/bgs/SD/bgssd.exe bgssd.exe -d /etc/bgs/SD
=========

Info: Applying configuration version '1588231128'
Notice: /Stage[main]/Main/File_line[disable_telnet]/ensure: created
Debug: /Stage[main]/Main/File_line[disable_telnet]: The container Class[Main] will propagate my refresh event
Notice: /Stage[main]/Main/File_line[disable_telnet_tcpwrapper]/ensure: created
Debug: /Stage[main]/Main/File_line[disable_telnet_tcpwrapper]: The container Class[Main] will propagate my refresh event
Debug: Class[Main]: The container Stage[main] will propagate my refresh event
Debug: Finishing transaction 34111620
Debug: Storing state
Debug: Pruned old state cache entries in 0.00 seconds
Debug: Stored state in 0.04 seconds
Notice: Applied catalog in 0.19 seconds
