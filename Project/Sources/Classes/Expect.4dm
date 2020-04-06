
Class constructor
	This:C1470.value:=$1
	This:C1470.callBy:=Get call chain:C1662[1]  // or if from outside of components?
	
	  // static init
	If (cs:C1710.Expect.verify=Null:C1517)
		Use (cs:C1710.Expect)
			If (cs:C1710.Expect.verify=Null:C1517)
				cs:C1710.Expect.verify:=Formula:C1597(ASSERT:C1129(Bool:C1537(This:C1470.pass);String:C10(This:C1470.message)+"\n("+JSON Stringify:C1217(This:C1470.callBy)+")"))
			End if 
		End use 
	End if 
	
Function to
	C_OBJECT:C1216($0;$1)  // function of predicate
	$expression:=$1
	$result:=$expression.execute(This:C1470.value)
	This:C1470.enhanceMessage($result;$2)
	$0:=This:C1470.verify($result)
	
Function toNot
	C_OBJECT:C1216($0;$1)  // function of predicate
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
	cs:C1710.Expect.verify.call($1)
	
Function enhanceMessage
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