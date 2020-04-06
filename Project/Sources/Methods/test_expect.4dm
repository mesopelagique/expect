//%attributes = {}
_:=spec 

_.expect(1+1).to(_.equal(2))
  //_ .expect(1+1).to(_ .equal(4);"bad test")

_.expect("seahorse").to(_.contain("sea");"correct test")
  //_ .expect("seahorse").to(_ .contain("seazz");"bad test")

_.expect("").to(_.beEmpty())
  //_.expect("not empty").to(_.beEmpty())
_.expect("not empty").toNot(_.beEmpty())

_.expect(New collection:C1472()).to(_.beEmpty())
  //_.expect(New collection("not empty")).to(_.beEmpty())
_.expect(New collection:C1472("not empty")).toNot(_.beEmpty())

_.expect(New object:C1471()).to(_.beEmpty())
_.expect(New object:C1471("key";"value")).toNot(_.beEmpty())

_.expect("seahorse").to(_.beginWith("sea"))
_.expect("seahorse").toNot(_.beginWith("horse"))
_.expect("seahorse").to(_.endWith("horse"))
_.expect("seahorse").toNot(_.endWith("endWith"))

_.expect(New collection:C1472("sea";"horse";"seahorse")).to(_.beginWith("sea"))
_.expect(New collection:C1472()).toNot(_.beginWith("sea"))
_.expect(New collection:C1472("horse";"sea")).toNot(_.beginWith("sea"))

_.expect(New collection:C1472("horse";"seahorse";"sea")).to(_.endWith("sea"))
_.expect(New collection:C1472()).toNot(_.endWith("sea"))
_.expect(New collection:C1472("sea";"horse")).toNot(_.endWith("sea"))

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

_.expect(cs:C1710.Predicate.new()).to(_.beAnInstanceOf(cs:C1710.Predicate))
_.expect(cs:C1710.Predicate.new()).toNot(_.beAnInstanceOf(cs:C1710.Expect))
_.expect(New object:C1471).toNot(_.beAnInstanceOf(cs:C1710.Expect))

_.expect("").to(_.haveLength(0))
_.expect("test").to(_.haveLength(4))
_.expect(New collection:C1472()).to(_.haveLength(0))
_.expect(New collection:C1472("test";"test")).to(_.haveLength(2))

  // TODO
  //_ .expect(1.2).to(_ .beCloseTo(1.1;0.1))// expected, within: delta

  //_ .expect(turtles).to(containElementSatisfying(Formula)
  //_ .expect([1, 2, 3, 4]).to(allPass(beLessThan(5)))
