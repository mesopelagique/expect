//%attributes = {}
_:=tu 

_.expect(1+1).to(_.equal(2))
  //_ .expect(1+1).to(_ .equal(4);"bad test")

_.expect("seahorse").to(_.contain("sea");"correct test")
  //_ .expect("seahorse").to(_ .contain("seazz");"bad test")

_.expect(New collection:C1472("Atlantic";"Pacific";"Mississippi")).to(_.contain("Mississippi"))
  //_ .expect(New collection("Atlantic";"Pacific")).to(_ .contain("Mississippi"))

_.expect(New collection:C1472("Atlantic";"Pacific")).toNot(_.contain("Mississippi"))
  //_ .expect(New collection("Atlantic";"Pacific";"Mississippi")).toNot(_ .contain("Mississippi"))

_.expect(Null:C1517).to(_.beNull())
  //_ .expect("Null").to(_ .beNil())

_.expect("Null").notTo(_.beNull())
  //_ .expect(Null).notTo(_ .beNull())

_.expect(True:C214).to(_.beTrue())
  //_ .expect(False).to(_ .beTrue())
_.expect(False:C215).to(_.beFalse())
  //_ .expect(True).to(_ .beFalse())

_.expect(True:C214).to(_.beTruthy())
  //_ .expect(False).to(_ .beTruthy())
_.expect(New object:C1471("message";"Test";"success";True:C214)).to(_.beTruthy())
  //_ .expect(New object("message";"Test";"success";False)).to(_ .beTruthy())
_.expect(New collection:C1472("message";"Test";"success";True:C214)).to(_.beTruthy())
  //_ .expect(New collection("message";"Test";"success";False)).to(_ .beTruthy())
_.expect(False:C215).to(_.beFalsy())
  //_ .expect(True).to(_ .beFalsy())
_.expect(New object:C1471("message";"Test";"success";False:C215)).to(_.beFalsy())
  //_ .expect(New object("message";"Test";"success";True)).to(_ .beFalsy())
_.expect(New collection:C1472("message";"Test";"success";False:C215)).to(_.beFalsy())
  //_ .expect(New collection("message";"Test";"success";True)).to(_ .beFalsy())

_.expect(1).to(_.beLessThan(2))
_.expect(1).to(_.beLessThanOrEqualTo(2))
_.expect(1).to(_.beLessThanOrEqualTo(1))
_.expect(3).to(_.beGreaterThan(2))
_.expect(3).to(_.beGreaterThanOrEqualTo(2))
_.expect(3).to(_.beGreaterThanOrEqualTo(3))
_.expect(3).notTo(_.beGreaterThanOrEqualTo(4))

  // TODO
  //_ .expect(1.2).to(_ .beCloseTo(1.1;0.1))// expected, within: delta
  //_ .expect(structObject).to(_ .beAnInstanceOf(cs.SomeClass))
  //_ .expect(actual).to(beEmpty());
  //_ .expect(actual).to(beginWith(expected...))
  //_ .expect(actual).to(endWith(expected...)
  //_ .expect(turtles).to(containElementSatisfying(Formula)
  //_ .expect(actual).to(haveCount(expected))
  //_ .expect([1, 2, 3, 4]).to(allPass(beLessThan(5)))
