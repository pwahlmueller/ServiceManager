#
# Sometimes ServiceRequests get stuck and do not start
# This starts the sr
#
# Change the status of a manual activity to active 

Import-Module SMLets -Force

$MANR = 'MA716479'
$SRNR = 'MA0000'

$smdefaultcomputer = 'scsm'

$MAClass = Get-SCSMClass -Name System.WorkItem.Activity.ManualActivity$
$SRClass = Get-SCSMClass -Name System.WorkItem.servicerequest$
$MAObject = Get-SCSMObject -Class $MAClass -filter "ID -eq $MANR"
Set-SCSMObject -SMObject $MAObject -Property Status -Value Active
$sr = Get-SCSMObject -Class $SRAClass -filter "ID -eq $SRNR"
Set-SCSMObject -SMObject $SR  -Property Status -Value completed
