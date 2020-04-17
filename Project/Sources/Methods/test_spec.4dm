//%attributes = {}
_:=spec 

C_BOOLEAN:C305($bool)
$bool:=False:C215
While (_.describe("When"))
	
	While (_.describe("imbricating"))
		
		While (_.it("should do a test"))
			
			_.expect(_.message()).toNot(_.beEmpty())
			$bool:=True:C214
			
		End while 
		
	End while 
	
End while 

While (_.describe("Otherwise"))
	
	While (_.it("imbricating"))
		
		_.expect($bool).to(_.beTrue())
		
	End while 
	
End while 