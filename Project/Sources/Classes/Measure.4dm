Class constructor
	C_LONGINT:C283($1)
	This:C1470.maxIteration:=$1
	This:C1470.cursor:=0
	This:C1470.automaticallyStartMeasuring:=True:C214
	This:C1470.timers:=New collection:C1472()
	
Function hasNext
	C_BOOLEAN:C305($0)
	$0:=This:C1470.maxIteration>This:C1470.cursor
	If (This:C1470.automaticallyStartMeasuring)
		This:C1470.stop()
	End if 
	
Function next
	C_BOOLEAN:C305($0)
	$0:=This:C1470.hasNext()
	If ($0)
		If (This:C1470.automaticallyStartMeasuring)
			This:C1470.start()
		End if 
	End if 
	
Function start
	C_OBJECT:C1216($timer)
	$timer:=cs:C1710.Timer.new()
	$timer.start()
	This:C1470.timers[This:C1470.cursor]:=$timer
	This:C1470.cursor:=This:C1470.cursor+1
	
Function stop
	C_OBJECT:C1216($timer)
	If ((This:C1470.cursor>0) & ((This:C1470.cursor-1)<This:C1470.timers.length))
		$timer:=This:C1470.timers[This:C1470.cursor-1]
		If ($timer#Null:C1517)
			This:C1470.timers[This:C1470.cursor-1].stop()
		End if 
	End if 
	
Function durations
	C_COLLECTION:C1488($0)
	$0:=This:C1470.timers.extract("duration")
	
Function durationAverage
	C_LONGINT:C283($0)
	$0:=This:C1470.timers.extract("duration").average()