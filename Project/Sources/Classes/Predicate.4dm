
Class constructor
	C_TEXT:C284($1)
	C_VARIANT:C1683($2)
	This:C1470.formula:=$1
	This:C1470.value:=$2
	
	C_VARIANT:C1683(${2})
	C_LONGINT:C283($count)
	$count:=Count parameters:C259
	If ($count>2)
		This:C1470.values:=New collection:C1472()
		C_LONGINT:C283($i)
		For ($i;2;$count;1)
			This:C1470.values.push(${$i})
		End for 
	End if 
	
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
	
Function beginWith
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)  // XXX for collection could support more than one elemeent
	$0:=New object:C1471()
	
	Case of 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=New collection:C1472(This:C1470.value).equal($1.slice(0;1))  // XXX and here adapt slice
			If (Not:C34($0.pass))
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' is not first element of'"+This:C1470.stringify($1)+"'"
			Else 
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' must not  be first element of '"+This:C1470.stringify($1)+"'"
			End if 
		: (Value type:C1509($1)=Is text:K8:3)
			$0.pass:=Position:C15(This:C1470.stringify(This:C1470.value);$1)=1
			If (Not:C34($0.pass))
				$0.message:="'"+String:C10($1)+"' does not begin with '"+This:C1470.stringify(This:C1470.value)+"'"
			Else 
				$0.message:="'"+String:C10($1)+"' must not begin with '"+This:C1470.stringify(This:C1470.value)+"'"
			End if 
		Else 
			$0.pass:=False:C215
			$0.message:="Unexpected type for contain predicate: "+String:C10(Value type:C1509(This:C1470.value))
	End case 
	
Function endWith
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	
	Case of 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=New collection:C1472(This:C1470.value).equal($1.slice(-1))  // XXX and here adapt slice
			If (Not:C34($0.pass))
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' is not the last element of '"+This:C1470.stringify($1)+"'"
			Else 
				$0.message:="'"+This:C1470.stringify(This:C1470.value)+"' must not be the last element of '"+This:C1470.stringify($1)+"'"
			End if 
		: (Value type:C1509($1)=Is text:K8:3)
			$0.pass:=Position:C15(This:C1470.stringify(This:C1470.value);$1)=(Length:C16($1)-Length:C16(This:C1470.stringify(This:C1470.value))+1)
			If (Not:C34($0.pass))
				$0.message:="'"+String:C10($1)+"' does not end with '"+This:C1470.stringify(This:C1470.value)+"'"
			Else 
				$0.message:="'"+String:C10($1)+"' must not end with '"+This:C1470.stringify(This:C1470.value)+"'"
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
			C_TEXT:C284($key)
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
			$0.message:="Unknown type "+String:C10(Value type:C1509($1))+" for beTruthy"
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
			C_TEXT:C284($key)
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
			$0.message:="Unknown type "+String:C10(Value type:C1509($1))+" for beFalsy"
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
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=($1=Null:C1517)
	If (Not:C34($0.pass))
		$0.message:="Expecting to be Nil but '"+This:C1470.stringify($1)+"' "
	Else 
		$0.message:="Expecting to be not Nil"
	End if 
	
Function beEmpty
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	Case of 
		: (Value type:C1509($1)=Is text:K8:3)
			$0.pass:=Length:C16($1)=0
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be empty"
			Else 
				$0.message:="Expecting to be not empty"
			End if 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=$1.length=0
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be empty"
			Else 
				$0.message:="Expecting to be not empty"
			End if 
		: (Value type:C1509($1)=Is object:K8:27)
			$0.pass:=OB Is empty:C1297($1)
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be empty"
			Else 
				$0.message:="Expecting to be not empty"
			End if 
		Else 
			
			$0.pass:=False:C215
			$0.message:="Unexpecting input type to check emptiness"
			
	End case 
	
Function haveLength
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	Case of 
		: (Value type:C1509($1)=Is text:K8:3)
			$0.pass:=Length:C16($1)=This:C1470.value
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to have length equal to "+String:C10(This:C1470.value)
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"'to not have length equal to "+String:C10(This:C1470.value)
			End if 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0.pass:=$1.length=This:C1470.value
			If (Not:C34($0.pass))
				$0.message:="Expecting '"+This:C1470.stringify($1)+"' to have length equal to "+String:C10(This:C1470.value)
			Else 
				$0.message:="Expecting '"+This:C1470.stringify($1)+"'to not have length equal to "+String:C10(This:C1470.value)
			End if 
			
		Else 
			
			$0.pass:=False:C215
			$0.message:="Unexpecting input type to check emptiness"
			
	End case 
	
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
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	$0.pass:=Num:C11($1)>=Num:C11(This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to be greater or equal than '"+This:C1470.stringify($1)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify(This:C1470.value)+"' to not to be greater or equal than '"+This:C1470.stringify($1)+"'"
	End if 
	
Function beCloseTo
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1)
	$0:=New object:C1471()
	
	This:C1470.delta:=Num:C11(This:C1470.values[1])
	$0.pass:=((Num:C11($1)>=(Num:C11(This:C1470.value)-This:C1470.delta)) & (Num:C11($1)<=(Num:C11(This:C1470.value)+This:C1470.delta)))
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be close to '"+This:C1470.stringify(This:C1470.value)+"' with delta '"+String:C10(This:C1470.delta)+""
	Else 
		$0.message:="Expecting '"+This:C1470.stringify($1)+"' to be notclose to '"+This:C1470.stringify(This:C1470.value)+"' with delta '"+String:C10(This:C1470.delta)+""
	End if 
	
	
Function beAnInstanceOf
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($1)
	
	$0:=New object:C1471()
	$0.pass:=OB Instance of:C1731($1;This:C1470.value)
	If (Not:C34($0.pass))
		$0.message:="Expecting '"+This:C1470.stringify($1)+":"+This:C1470.stringify(OB Class:C1730($1))+"' to be instance of '"+This:C1470.stringify(This:C1470.value)+"'"
	Else 
		$0.message:="Expecting '"+This:C1470.stringify($1)+":"+This:C1470.stringify(OB Class:C1730($1))+"' to be instance of '"+This:C1470.stringify(This:C1470.value)+"'"
	End if 
	
Function allPass
	C_OBJECT:C1216($0)
	C_COLLECTION:C1488($1)
	$0:=New object:C1471()
	C_VARIANT:C1683($var)
	C_OBJECT:C1216($result)
	$0.pass:=True:C214
	For each ($var;$1)
		$result:=This:C1470.value.execute($var)
		If (Not:C34($result.pass))
			$0.pass:=False:C215
			$0.message:=$result.message
		End if 
	End for each 
	  // XXX message if not passing
	
Function containElementSatisfying
	C_OBJECT:C1216($0)
	C_COLLECTION:C1488($1)
	$0:=New object:C1471()
	C_VARIANT:C1683($var)
	$0.pass:=False:C215
	For each ($var;$1) Until ($0.pass)
		$0.pass:=This:C1470.value.call(New object:C1471("value";$var))
	End for each 
	If (Not:C34($0.pass))
		$0.message:="No element of "+This:C1470.stringify($1)+" satisfy the passed formula "+This:C1470.stringify(This:C1470.value)
	Else 
		$0.message:="One element of "+This:C1470.stringify($1)+" satisfy the passed formula "+This:C1470.stringify(This:C1470.value)+" but must not"
	End if 
	
Function raiseError
	C_OBJECT:C1216($0)
	C_OBJECT:C1216($1)
	$0:=New object:C1471()
	$0.pass:=False:C215
	
	If (OB Instance of:C1731($1;4D:C1709.Function))
		C_TEXT:C284($restoreOnError)
		$restoreOnError:=Method called on error:C704
		ON ERR CALL:C155("catchError")
		Error:=0
		$1.call(Null:C1517)
		$0.pass:=(Error#0)
		If (Not:C34($0.pass))
			$0.message:="Expected to raise an error"
		Else 
			$0.message:="Expected to not raise an error:"
			ARRAY LONGINT:C221($aL_codes;0x0000)
			ARRAY TEXT:C222($aT_components;0x0000)
			ARRAY TEXT:C222($aT_errors;0x0000)
			GET LAST ERROR STACK:C1015($aL_codes;$aT_components;$aT_errors)
			
			If (Size of array:C274($aT_errors)>0)
				
				If (Length:C16($aT_errors{1})>0)
					
					If (Application type:C494=4D Remote mode:K5:5)\
						 | ((Position:C15($aT_errors{1};ERROR FORMULA)=0) & (Length:C16(ERROR FORMULA)#0))
						
						If (This:C1470.value#Null:C1517)  // check message
							Case of 
								: (Value type:C1509(This:C1470.value)=Is text:K8:3)
									$0.pass:=(This:C1470.value=$aT_errors{1})
									If (Not:C34($0.pass))
										$0.message:="Expected to raise an error with message "+String:C10(This:C1470.value)+" but receive "+$aT_errors{1}
									End if 
								: (Value type:C1509(This:C1470.value)=Is real:K8:4)
									$0.pass:=(This:C1470.value=$aL_codes{1})
									If (Not:C34($0.pass))
										$0.message:="Expected to raise an error with code "+String:C10(This:C1470.value)+" but receive "+String:C10($aL_codes{1})
									End if 
							End case 
							
						End if 
						
						If ($0.pass)
							$0.message:=$0.message+":"+$aT_errors{1}
						End if 
						
					End if 
				End if 
			End if 
		End if 
		ON ERR CALL:C155($restoreOnError)
	Else 
		$0.message:="Passed object must be a function"
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
			
			Case of 
				: (OB Instance of:C1731($1;4D:C1709.Function))
					$0:="Function("+String:C10($1.source)+")"
				: (OB Instance of:C1731($1;4D:C1709.Folder))
					$0:="Folder("+String:C10($1.path)+")"
				: (OB Instance of:C1731($1;4D:C1709.File))
					$0:="File("+String:C10($1.path)+")"
				Else 
					$0:=JSON Stringify:C1217($1)
			End case 
		: (Value type:C1509($1)=Is collection:K8:32)
			$0:=JSON Stringify:C1217($1)
		Else 
			$0:=String:C10($1)
	End case 
	