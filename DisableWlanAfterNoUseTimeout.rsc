/system script
add name=DisableWlanAfterNoUseTimeout owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive source=":global\
    \_WirelessClients \"\";\r\
    \n:global jvnWiFiTurnOffWirlessClientCount 0;\r\
    \n:global jvnWiFiTurnOffCountDownMaxValue 30;\r\
    \n:global jvnWiFiTurnOffCountDown 0;\r\
    \n:global jvnWiFiTurnOffStatus \"Running\";\r\
    \n:global jvnWiFiTurnOffDelay 60s;\r\
    \n:global jvnWiFiTurnOffRunningFlag 1;\r\
    \n\r\
    \n:set jvnWiFiTurnOffCountDown \$jvnWiFiTurnOffCountDownMaxValue;\r\
    \n:log info \"Starting WiFi shutdown script\";\r\
    \n\r\
    \nwhile (true) do={\r\
    \n\r\
    \n  :set jvnWiFiTurnOffWirlessClientCount 0;\r\
    \n  :global WirelessClients \"* Wireless clients * \\n\";\r\
    \n\r\
    \n  :foreach int in=[/interface wireless registration-table find] do={\r\
    \n    :set jvnWiFiTurnOffWirlessClientCount (\$jvnWiFiTurnOffWirlessClient\
    Count+1);\r\
    \n    :set WirelessClients \"\$WirelessClients \$[/interface wireless regi\
    stration-table get \$int mac-address] on \$[/interface wireless registrati\
    on-table get \$int interface] \$[/interface wireless registration-table ge\
    t \$int signal-strength] \\n\" ;    \r\
    \n  }\r\
    \n  \r\
    \n  :if (\$jvnWiFiTurnOffWirlessClientCount = 0) do={\r\
    \n    :set jvnWiFiTurnOffCountDown (\$jvnWiFiTurnOffCountDown-1);\r\
    \n  } else={\r\
    \n    :set jvnWiFiTurnOffCountDown \$jvnWiFiTurnOffCountDownMaxValue;\r\
    \n  }\r\
    \n\r\
    \n  :if ((\$jvnWiFiTurnOffCountDown <= 0) || (\$jvnWiFiTurnOffRunningFlag \
    <= 0)) do={\r\
    \n    :if ((\$jvnWiFiTurnOffRunningFlag > 0) && (\$jvnWiFiTurnOffCountDown\
    \_<= 0)) do={\r\
    \n        :set jvnWiFiTurnOffStatus \"Disabling WLAN and Exiting\";\r\
    \n        :log info \"Disabling WLAN\";\r\
    \n        interface wireless disable wlan2;\r\
    \n        interface wireless disable wlan1;\r\
    \n    } else={\r\
    \n        :set jvnWiFiTurnOffStatus \"Exiting (WIFI has not been disabled)\
    \";\r\
    \n        :log info \"Exiting (WIFI has not been disabled)\";\r\
    \n    }\r\
    \n    :set jvnWiFiTurnOffRunningFlag 0;\r\
    \n    :return;\r\
    \n  } else={\r\
    \n    :set jvnWiFiTurnOffStatus \"Waiting...\";\r\
    \n    :delay \$jvnWiFiTurnOffDelay;\r\
    \n  }\r\
    \n\r\
    \n}"
