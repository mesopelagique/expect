Class constructor
	
Function start
	ASSERT:C1129(This:C1470.startTime=Null:C1517; "Timer already started")
	This:C1470.startTime:=This:C1470._currentTime()
	
Function stop
	This:C1470.endTime:=This:C1470._currentTime()
	ASSERT:C1129(This:C1470.startTime#Null:C1517; "Timer must be started before stoped")
	This:C1470.duration:=This:C1470.endTime-This:C1470.startTime
	
Function _currentTime
	C_LONGINT:C283($0)
	$0:=Milliseconds:C459
/*
// the following code has no milliseconds
C_TIME($currentTime; $timeGMT)
C_DATE($dateGMT)
$currentTime:=Current time
$timeGMT:=Time(Replace string(Delete string(String(Current date; ISO date GMT; $currentTime); 1; 11); "Z"; ""))
$dateGMT:=Date(Delete string(String(Current date; ISO date GMT; $currentTime); 12; 20)+"00:00:00")
	
// Convert date and time in number of seconds
	
C_LONGINT($0)
$0:=(($dateGMT-Add to date(!00-00-00!; 1970; 1; 1))*86400)+($timeGMT+0)*/
	