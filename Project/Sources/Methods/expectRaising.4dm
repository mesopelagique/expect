//%attributes = {"shared":true}
#DECLARE($value : Variant)->$expectation : cs:C1710.Expect

$expectation:=spec.expect($value).to(raiseError())