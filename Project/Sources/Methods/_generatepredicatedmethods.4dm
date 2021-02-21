//%attributes = {}
var $file : 4D:C1709.File

var $predicate : Text
For each ($predicate; spec.predicates)
	
	$file:=Folder:C1567(fk database folder:K87:14).folder("Project/Sources/Methods").file($predicate+".4dm")
	
	var $code : Text
	
	$code:="//%attributes = {\"shared\":true}\n"
	$code:=$code+"#DECLARE($value : Variant)->$expectation : cs.Predicate\n"
	$code:=$code+"\n"
	$code:=$code+"$expectation:=cs.Predicate.new(Current method name; $value)\n"
	
	$file.setText($code)
	
End for each 
