//%attributes = {}

expect("5").toNot(beEmpty())
expect("").to(beEmpty())

expect("5").to(beEqualTo("5"))
expect("5").toNot(beEqualTo("1"))
expect("").to(beEqualTo(""))

expect("seahorse").to(contain("sea"); "correct test")

expect("").to(beEmpty())
expect("not empty").toNot(beEmpty())

expect(New collection:C1472()).to(beEmpty())
expect(New collection:C1472("not empty")).toNot(beEmpty())

expect(New object:C1471()).to(beEmpty())
expect(New object:C1471("key"; "value")).toNot(beEmpty())

expectRaising(Formula:C1597(expect(New collection:C1472("not empty")).to(beEmpty())))