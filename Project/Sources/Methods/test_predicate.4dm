//%attributes = {}
_:=spec 

C_OBJECT:C1216($predicate)
$predicate:=cs:C1710.Predicate.new()
C_TEXT:C284($predicateName)
For each ($predicateName;_.predicates)
	_.expect($predicate[$predicateName]).toNot(_.beNull())
	_.expect($predicate[$predicateName]).to(_.beAnInstanceOf(4D:C1709.Function))
End for each 