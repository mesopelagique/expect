//%attributes = {}

_:=spec

C_LONGINT:C283($it; $cpt; $i)
$it:=5

C_OBJECT:C1216($mesure)
$mesure:=_.measure($it)

$cpt:=0
While ($mesure.next())
	
	$cpt:=$cpt+1
	
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	
End while 

ASSERT:C1129($cpt=$it; "wrong iteration number")

C_COLLECTION:C1488($durations)
$durations:=$mesure.durations()
ASSERT:C1129($durations.length=$cpt)

C_REAL:C285($avg)
$avg:=$mesure.durationAverage()

// with has next

$mesure:=_.measure($it)

$cpt:=0
While ($mesure.hasNext())
	
	$cpt:=$cpt+1
	
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	
	$mesure.next()
End while 

ASSERT:C1129($cpt=$it; "wrong iteration number")

ASSERT:C1129($mesure.durations().length=$cpt)

// automaticallyStartMeasuring to false
$mesure:=_.measure($it)
$mesure.automaticallyStartMeasuring:=False:C215
$cpt:=0
While ($mesure.hasNext())
	
	$cpt:=$cpt+1
	
	$mesure.start()
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	$mesure.stop()
	
	$mesure.next()
End while 

ASSERT:C1129($cpt=$it; "wrong iteration number")
ASSERT:C1129($mesure.durations().length=$cpt)

// automaticallyStartMeasuring to false
$mesure:=_.measure($it)
$mesure.automaticallyStartMeasuring:=False:C215
$cpt:=0
While ($mesure.next())
	
	$cpt:=$cpt+1
	
	$mesure.start()
	$i:=0
	While ($i<Random:C100)
		$i:=$i+1
	End while 
	$mesure.stop()
End while 

ASSERT:C1129($cpt=$it; "wrong iteration number")
ASSERT:C1129($mesure.durations().length=$cpt)
