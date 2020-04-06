//%attributes = {}

tu .expect(1+1).to(tu .equal(2))
  //tu .expect(1+1).to(tu .equal(4);"bad test")

tu .expect("seahorse").to(tu .contain("sea");"correct test")
  //tu .expect("seahorse").to(tu .contain("seazz");"bad test")

tu .expect(New collection:C1472("Atlantic";"Pacific";"Mississippi")).to(tu .contain("Mississippi"))
  //tu .expect(New collection("Atlantic";"Pacific")).to(tu .contain("Mississippi"))

tu .expect(New collection:C1472("Atlantic";"Pacific")).toNot(tu .contain("Mississippi"))
  //tu .expect(New collection("Atlantic";"Pacific";"Mississippi")).toNot(tu .contain("Mississippi"))

tu .expect(Null:C1517).to(tu .beNull())
  //tu .expect("Null").to(tu .beNil())

tu .expect("Null").notTo(tu .beNull())
  //tu .expect(Null).notTo(tu .beNull())

tu .expect(True:C214).to(tu .beTrue())
  //tu .expect(False).to(tu .beTrue())
tu .expect(False:C215).to(tu .beFalse())
  //tu .expect(True).to(tu .beFalse())

tu .expect(True:C214).to(tu .beTruthy())
  //tu .expect(False).to(tu .beTruthy())
tu .expect(New object:C1471("message";"Test";"success";True:C214)).to(tu .beTruthy())
  //tu .expect(New object("message";"Test";"success";False)).to(tu .beTruthy())
tu .expect(New collection:C1472("message";"Test";"success";True:C214)).to(tu .beTruthy())
  //tu .expect(New collection("message";"Test";"success";False)).to(tu .beTruthy())
tu .expect(False:C215).to(tu .beFalsy())
  //tu .expect(True).to(tu .beFalsy())
tu .expect(New object:C1471("message";"Test";"success";False:C215)).to(tu .beFalsy())
  //tu .expect(New object("message";"Test";"success";True)).to(tu .beFalsy())
tu .expect(New collection:C1472("message";"Test";"success";False:C215)).to(tu .beFalsy())
  //tu .expect(New collection("message";"Test";"success";True)).to(tu .beFalsy())

tu .expect(1).to(tu .beLessThan(2))
tu .expect(1).to(tu .beLessThanOrEqualTo(2))
tu .expect(1).to(tu .beLessThanOrEqualTo(1))
tu .expect(3).to(tu .beGreaterThan(2))
tu .expect(3).to(tu .beGreaterThanOrEqualTo(2))
tu .expect(3).to(tu .beGreaterThanOrEqualTo(3))
tu .expect(3).notTo(tu .beGreaterThanOrEqualTo(4))

  // TODO
  //tu .expect(1.2).to(tu .beCloseTo(1.1;0.1))// expected, within: delta
  //tu .expect(structObject).to(tu .beAnInstanceOf(cs.SomeClass))
  //tu .expect(actual).to(beEmpty());
  //tu .expect(actual).to(beginWith(expected...))
  //tu .expect(actual).to(endWith(expected...)
  //tu .expect(turtles).to(containElementSatisfying(Formula)
  //tu .expect(actual).to(haveCount(expected))
  //tu .expect([1, 2, 3, 4]).to(allPass(beLessThan(5)))
