//%attributes = {}

C_TEXT:C284($1;$cmd)
$cmd:=$1
C_TEXT:C284($2;$method)
$method:=$2
Case of 
	: (Position:C15("[class]/";$method)=1)
		$method:=Replace string:C233($method;"[class]/";"")
		$method:="test_"+Lowercase:C14($method)
	: (Position:C15("test";$method)=0)
		$method:="test_"+$method
End case 

Case of 
	: ($cmd="run")
		
		EXECUTE METHOD:C1007($method)
		
	: ($cmd="open")
		
		METHOD OPEN PATH:C1213($method)
		
	: ($cmd="new")
		
		METHOD SET CODE:C1194(String:C10($2);"_:=spec\n")
		METHOD OPEN PATH:C1213($method)
		
End case 