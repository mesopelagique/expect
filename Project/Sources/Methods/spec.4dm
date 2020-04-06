//%attributes = {"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($0)

If (cs:C1710.Predicate.builder=Null:C1517)
	Use (cs:C1710.Predicate)
		cs:C1710.Predicate.builder:=New shared object:C1526()
		
		cs:C1710.Predicate.builder["new"]:=Formula:C1597(cs:C1710.Expect.new($1))
		cs:C1710.Predicate.builder["expect"]:=Formula:C1597(cs:C1710.Expect.new($1))
		
		C_COLLECTION:C1488($cols)
		$cols:=New collection:C1472("beEqualTo";"equal";"beCloseTo";"contain";\
			"beLessThan";"beLessThanOrEqualTo";"beGreaterThan";"beGreaterThanOrEqualTo";\
			"beTruthy";"beTrue";"beFalsy";"beFalse";"beNull";"beEmpty";"haveLength";"beginWith";"endWith";\
			"beAnInstanceOf";"allPass")
		
		C_TEXT:C284($predicate)
		For each ($predicate;$cols)
			cs:C1710.Predicate.builder[$predicate]:=Formula:C1597(cs:C1710.Predicate.new($predicate;$1;$2))
		End for each 
		
	End use 
End if 
$0:=cs:C1710.Predicate.builder