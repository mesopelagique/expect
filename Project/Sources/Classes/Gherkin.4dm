
/*alternative parsing using gherkin syntax*/
Class constructor
	C_VARIANT:C1683($1)
	C_TEXT:C284($text;$line;$keyword)
	
	Case of 
		: (Value type:C1509($1)=Is object:K8:27)
			ASSERT:C1129(OB Instance of:C1731($1;4D:C1709.File))
			$text:=$1.getText("utf8";Document with LF:K24:22)
		: (Value type:C1509($1)=Is text:K8:3)
			$text:=$1
		Else 
			ASSERT:C1129(False:C215;"Unknow parameter type for gherkin")
	End case 
	
	This:C1470.lines:=Split string:C1554($text;"\n")
	C_OBJECT:C1216($option)
	This:C1470.options:=New collection:C1472()
	For each ($line;This:C1470.lines)
		
		$keyword:=Substring:C12($line;1;Position:C15(" ";$line)-1)
		If (Length:C16($keyword)>0)
			$option:=New object:C1471("keyword";$keyword;"description";Substring:C12($line;Length:C16($keyword)+2))
			This:C1470.options.push($option)
		End if 
	End for each 
	
	