/system script
add name=EnableWLAN owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source=":log in\
    fo \"Starting WiFi adapter\";\r\
    \n\r\
    \n# Pass via a global flag STOP signal to the script that is switching off\
    \_the WLAN (if running whole night for example due to an existing connecti\
    ons).\r\
    \n:global jvnWiFiTurnOffRunningFlag 0;\r\
    \n\r\
    \ninterface wireless enable wlan1;\r\
    \ninterface wireless enable wlan2;"