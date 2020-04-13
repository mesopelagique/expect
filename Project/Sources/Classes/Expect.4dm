
Class constructor
	C_VARIANT:C1683($1)
	C_OBJECT:C1216($2)
	This:C1470.value:=$1
	This:C1470.spec:=$2
	This:C1470.callBy:=Get call chain:C1662[2]  // or if from outside of components?
	
Function to
	C_OBJECT:C1216($0;$result)
	C_OBJECT:C1216($1;$expression)  // function of predicate
	C_VARIANT:C1683($2)
	
	$expression:=$1
	$result:=$expression.execute(This:C1470.value)
	This:C1470.enhanceMessage($result;$2)
	$0:=This:C1470.verify($result)
	
Function toNot
	C_OBJECT:C1216($0;$result)
	C_OBJECT:C1216($1;$expression)  // function of predicate
	C_TEXT:C284($2)
	$expression:=$1
	$result:=$expression.execute(This:C1470.value)
	$result.pass:=Not:C34($result.pass)
	This:C1470.enhanceMessage($result;$2)
	This:C1470.verify($result)
	$0:=$result
	
Function notTo
	C_OBJECT:C1216($0;$1)
	$0:=This:C1470.toNot($1)
	
Function verify  // (_ pass: Bool, _ message: FailureMessage)
	C_OBJECT:C1216($1)
	This:C1470.spec.verify.call(This:C1470.spec;$1)
	
Function enhanceMessage
	C_OBJECT:C1216($1;$result)
	C_TEXT:C284($2)
	$result:=$1
	If (Not:C34(Bool:C1537($result.pass)))
		If (Length:C16(String:C10($2))>0)
			$result.message:=String:C10($2)+":"+String:C10($result.message)
		End if 
	End if 
	$result.callBy:=This:C1470.callBy
	If ($result.message=Null:C1517)
		$result.message:=""
	End if 