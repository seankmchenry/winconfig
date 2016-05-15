rem Remote Registry
net stop RemoteRegistry
sc config RemoteRegistry start= disabled

rem Routing and Remote Access
net stop RemoteAccess
sc config RemoteAccess start= disabled

rem Smart Card
net stop SCardSvr
sc config SCardSvr start= disabled

rem AllJoyn Router Service
net stop AJRouter
sc config AJRouter start= disabled

rem Windows Media Player Network Sharing Service
net stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

rem Bonjour Service
net stop "Bonjour Service"
sc config "Bonjour Service" start= disabled

rem Intel(R) Smart Connect Technology Agent
net stop ISCTAgent
sc config ISCTAgent start= disabled

rem Touch Keyboard and Handwriting Panel Service
net stop TabletInputService
sc config TabletInputService start= disabled

rem Distributed Link Tracking Client
net stop TrkWks
sc config TrkWks start= disabled

rem IP Helper
net stop iphlpsvc
sc config iphlpsvc start= disabled

rem Windows MultiPoint Server Host Service
net stop Wms
sc config Wms start= disabled

rem Windows MultiPoint Repair Host Service
net stop WmsRepair
sc config WmsRepair start= disabled

rem Windows Remote Management (WS-Management)
net stop WinRM
sc config WinRM start= disabled

rem dmwappushsvc
net stop dmwappushsvc
sc config dmwappushsvc start= disabled

rem Downloaded Maps Manager
net stop MapsBroker
sc config MapsBroker start= disabled

rem World Wide Web Publishing Service
net stop W3SVC
sc config W3SVC start= disabled

rem Print Spooler
net stop Spooler
sc config Spooler start= disabled

rem Offline Files
net stop CscService
sc config CscService start= disabled
