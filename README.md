# MikrotikWiFiShutdown
Script for Mikrotik routerboards that will control WIFI daily shutdown/startup process.

This script does not turn off the WiFi directly. 
Instead, it will start shudown script at a specified time (e.g. at 22:00) and this script will be checking periodically 
connected devices. After a specific idle time without any WiFi device connected to the router the WiFi will be turned off.

You can control shutdown/startup process using the following parameters:

 -  **jvnWiFiTurnOffCountDownMaxValue** - how many loops without any device connected to the WiFi 
 has to be passed to shutdown WiFi.
 - **jvnWiFiTurnOffDelay** - length of each loop in term of seconds.

 The WiFi should be enabled again (e.g. next day at 6:30 in the morning) using the second script.