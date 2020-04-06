
Class constructor
	C_TEXT:C284($1)
	This:C1470.formula:=$1
	This:C1470.value:=$2
	  // This.values:={$2,$3,$4...  // XXX array of args?
	
Function equal
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=New collection:C1472(This:C1470.value).equal(New collection:C1472($1))
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' but value is '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting to be not '"+This:C1470.stringify(This:C1470.value)+"'"
	End if 
	
Function beEqualTo
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=This:C1470.equal($1)
	
Function contain
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	
	Case of 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=$1.indexOf(This:C1470.value)>=0
			If (Not:C34($0.pass))
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' is not in '"+This:C1470.stringify($1)+"'"
			Else 
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' must not be in '"+This:C1470.stringify($1)+"'"
			End if 
		: (Value type:C1509($1)=Is text:K8:3)
			$0.pass:=Position:C15(This:C1470.stringify(This:C1470.value);$1)>0
			If (Not:C34($0.pass))
				$0.message:="'"+String:C10($1)+"' does not contain '"+This:C1470.stringify(This:C1470.value)+"'"
			Else 
				$0.message:="'"+String:C10($1)+"' must not contain '"+This:C1470.stringify(This:C1470.value)+"'"
			End if 
		Else 
			$0.pass:=False:C215
			$0.message:="Unexpected type for contain predicate: "+String:C10(Value type:C1509(This:C1470.value))
	End case 
	
Function beTruthy
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	Case of 
		: (Value type:C1509($1)=Is boolean:K8:9)
			$0.pass:=Bool:C1537($1)
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be True"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' not to be True"
			End if 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=False:C215
			C_VARIANT:C1683($var)
			For each ($var;$1) Until ($0.pass)
				If (Value type:C1509($var)=Is boolean:K8:9)
					If (Bool:C1537($var))
						$0.pass:=True:C214
					End if 
				End if 
			End for each 
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to contain True"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to not contain True"
			End if 
		: (Value type:C1509($1)=Is object:K8:27)
			$0.pass:=False:C215
			For each ($key;$1) Until ($0.pass)
				$var:=$1[$key]
				If (Value type:C1509($var)=Is boolean:K8:9)
					If (Bool:C1537($var))
						$0.pass:=True:C214
					End if 
				End if 
			End for each 
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to contain True"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to not contain True"
			End if 
		Else 
			$0.pass:=False:C215
			$0.message:="Unknown type "String:C10(Value type:C1509($1))+" for beTruthy"
	End case 
	
Function beTrue
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Bool:C1537($1)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be True"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' not to be True"
	End if 
	
Function beFalsy
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	Case of 
		: (Value type:C1509($1)=Is boolean:K8:9)
			$0.pass:=Not:C34(Bool:C1537($1))
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be False"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' not to be False"
			End if 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=False:C215
			C_VARIANT:C1683($var)
			For each ($var;$1) Until ($0.pass)
				If (Value type:C1509($var)=Is boolean:K8:9)
					If (Not:C34(Bool:C1537($var)))
						$0.pass:=True:C214
					End if 
				End if 
			End for each 
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to contain False"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to not contain False"
			End if 
		: (Value type:C1509($1)=Is object:K8:27)
			$0.pass:=False:C215
			For each ($key;$1) Until ($0.pass)
				$var:=$1[$key]
				If (Value type:C1509($var)=Is boolean:K8:9)
					If (Not:C34(Bool:C1537($var)))
						$0.pass:=True:C214
					End if 
				End if 
			End for each 
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to contain False"
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to not contain False"
			End if 
		Else 
			$0.pass:=False:C215
			$0.message:="Unknown type "String:C10(Value type:C1509($1))+" for beFalsy"
	End case 
	
Function beFalse
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Not:C34(Bool:C1537($1))
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be False"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' not to be False"
	End if 
	
Function beNull
	C_OBJECT:C1216($0)
	$0:=New object:C1471()
	$0.pass:=($1=Null:C1517)
	If (Not:C34($0.pass))
		$0.message:="Expecting to be Nil but '"+This:C1470.stringify($1)+"' "
	Else 
		$0.message:="Expecting to be not Nil"
	End if 
	
Function beLessThan
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Num:C11($1)<Num:C11(This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to be lesser than '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to not to be lesser than '"+This:C1470.stringify($1)+"'"
	End if 
	
Function beLessThanOrEqualTo
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Num:C11($1)<=Num:C11(This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to be lesser or equal than '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to not to be lesser or equal than '"+This:C1470.stringify($1)+"'"
	End if 
	
Function beGreaterThan
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Num:C11($1)>Num:C11(This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to be greater than '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to not to be greater than '"+This:C1470.stringify($1)+"'"
	End if 
	
Function beGreaterThanOrEqualTo
	C_OBJECT:C1216($0)
	$0:=New object:C1471()
	$0.pass:=Num:C11($1)>=Num:C11(This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to be greater or equal than '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to not to be greater or equal than '"+This:C1470.stringify($1)+"'"
	End if 
	
Function execute
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=This:C1470[This:C1470.formula].call(This:C1470;$1)
	
Function stringify
	C_TEXT:C284($0)
	C_VARIANT:C1683($1)
	Case of 
		: (Value type:C1509($1)=Is object:K8:27)
			$0:=JSON Stringify:C1217($1)
		: (Value type:C1509($1)=Is collection:K8:32)
			$0:=JSON Stringify:C1217($1)
		Else 
			$0:=String:C10($1)
	End case 
	