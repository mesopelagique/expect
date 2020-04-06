
Function expect
	$0:=cs:C1710.Expect.new($1)
	
Function beEqual
	$0:=cs:C1710.Predicate.new("beEqual";$1)
Function equal
	$0:=cs:C1710.Predicate.new("equal";$1)
Function beCloseTo
	$0:=cs:C1710.Predicate.new("beCloseTo";$1)
Function beLessThan
	$0:=cs:C1710.Predicate.new("beLessThan";$1)
Function beLessThanOrEqualTo
	$0:=cs:C1710.Predicate.new("beLessThanOrEqualTo";$1)
Function beGreaterThan
	$0:=cs:C1710.Predicate.new("beGreaterThan";$1)
Function beGreaterThanOrEqualTo
	$0:=cs:C1710.Predicate.new("beGreaterThanOrEqualTo";$1)
	
Function contain
	$0:=cs:C1710.Predicate.new("contain";$1)
	
Function beTruthy
	$0:=cs:C1710.Predicate.new("beTruthy")
Function beTrue
	$0:=cs:C1710.Predicate.new("beTrue")
Function beFalsy
	$0:=cs:C1710.Predicate.new("beFalsy")
Function beFalse
	$0:=cs:C1710.Predicate.new("beFalse")
Function beNull
	$0:=cs:C1710.Predicate.new("beNull")
	