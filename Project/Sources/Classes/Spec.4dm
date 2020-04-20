
Class constructor
	C_OBJECT:C1216($1;$options)
	$options:=$1
	If ($options=Null:C1517)
		$options:=New object:C1471()
	End if 
	
	This:C1470.descriptions:=New collection:C1472()
	This:C1470.verify:=Formula:C1597(This:C1470.verifyAlertAndCollect($1))
	
	This:C1470.results:=New object:C1471()  // XXX if identique test name, could remove a previous result
	
	This:C1470.predicates:=New collection:C1472("beEqualTo";"equal";"beCloseTo";"contain";\
		"beLessThan";"beLessThanOrEqualTo";"beGreaterThan";"beGreaterThanOrEqualTo";"beCloseTo";\
		"beTruthy";"beTrue";"beFalsy";"beFalse";"beNull";"beEmpty";"haveLength";"beginWith";"endWith";\
		"beAnInstanceOf";"allPass";"containElementSatisfying";"raiseError")
	
	C_TEXT:C284($predicate)
	For each ($predicate;This:C1470.predicates)
		This:C1470[$predicate]:=Formula:C1597(cs:C1710.Predicate.new($predicate;$1;$2))  // XXX limited to 2 parameters for the moment
	End for each 
	
	This:C1470.expectRaising:=Formula:C1597(This:C1470.expect($1).to(This:C1470.raiseError()))
	This:C1470.testPlans:=New collection:C1472()
	
	
Function describe
	C_BOOLEAN:C305($0)
	C_TEXT:C284($1)
	Case of 
		: ($1=This:C1470.current())  // end
			This:C1470.end()
			$0:=False:C215
		Else 
			This:C1470.descriptions.push($1)
			$0:=True:C214
	End case 
	
Function context  // alias describe
	C_BOOLEAN:C305($0)
	C_TEXT:C284($1)
	$0:=This:C1470.describe($1)
	
Function current
	C_TEXT:C284($0)
	If (This:C1470.descriptions.length>0)
		$0:=This:C1470.descriptions[This:C1470.descriptions.length-1]
	Else 
		$0:=""
	End if 
	
Function it
	C_BOOLEAN:C305($0)
	C_TEXT:C284($1)
	$0:=This:C1470.describe($1)
	
	If ($0)
		This:C1470.testPlans.push(This:C1470.message())
		If (This:C1470._beforeEach#Null:C1517)
			This:C1470._beforeEach.call(This:C1470)
		End if 
	Else 
		If (This:C1470._afterEach#Null:C1517)
			This:C1470._afterEach.call(This:C1470)
		End if 
	End if 
	
Function end
	C_TEXT:C284($value)
	$value:=This:C1470.descriptions.pop()
	  // clean before/each
	If (String:C10(This:C1470._beforeEachContext)=$value)
		This:C1470._beforeEachContext:=Null:C1517
		This:C1470._beforeEach:=Null:C1517
	End if 
	If (String:C10(This:C1470._afterEachContext)=$value)
		This:C1470._afterEachContext:=Null:C1517
		This:C1470._afterEach:=Null:C1517
	End if 
	
Function beforeEach
	C_OBJECT:C1216($1)
	This:C1470._beforeEach:=$1
	This:C1470._beforeEachContext:=This:C1470.current()
	
Function afterEach
	C_OBJECT:C1216($1)
	This:C1470._beforeEach:=$1
	This:C1470._afterEachContext:=This:C1470.current()
	
Function message
	C_TEXT:C284($0)
	$0:=This:C1470.descriptions.join(" ")
	
Function check
	ASSERT:C1129(This:C1470.descriptions.length=0;"There is some describe or it without and")
	
Function expect
	C_VARIANT:C1683($1)
	C_OBJECT:C1216($0)
	$0:=cs:C1710.Expect.new($1;This:C1470)
	
Function verifyAlertAndCollect
	C_OBJECT:C1216($1)  // error
	This:C1470.verifyCollect($1)
	This:C1470.verifyAlert($1)
	
Function verifyAlert
	C_OBJECT:C1216($1)  // error
	ASSERT:C1129(Bool:C1537($1.pass);String:C10(This:C1470.message())+"\n"+String:C10($1.message)+"\n("+JSON Stringify:C1217($1.callBy)+")")
	
Function verifyCollect
	C_OBJECT:C1216($1)  // error
	This:C1470.results[This:C1470.message()]:=$1
	
Function generateDoc
	C_OBJECT:C1216($0)
	C_TEXT:C284($1;$output;$test)
	
	$folder:=Folder:C1567(fk database folder:K87:14;*).folder("Documentation").folder("Methods")
	If (Not:C34($folder.exists))
		$folder.create()
	End if 
	$0:=$folder.file($1+".md")
	
	$output:="#"+$1+"\n\n"
	$output:=$output+"|Test|Result|\n"
	$output:=$output+"|---|---|\n"
	For each ($test;This:C1470.testPlans)
		$output:=$output+"|"+$test+"|"+Choose:C955(This:C1470.results[$test].pass;"✅";"❌")+"|\n"
	End for each 
	
	$0.setText($output)
	
	