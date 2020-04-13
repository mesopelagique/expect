# expect
[![language][code-shield]][code-url] [![language-top][code-top]][code-url] ![code-size][code-size] [![release][release-shield]][release-url] [![license][license-shield]][license-url] [![discord][discord-shield]][discord-url]

Behavior-driven development and test component inspired by [RSpec](https://relishapp.com/rspec)

## Usage

### Initialize instance
At the beginning of test method

```4d
_ = spec // return a spec instance
```

### Test description

You describe your test and the context using `_.describe`, and finally do your test using `_.it`
```4d
While (_.describe("A new Scanner"))
	While (_.describe("for an empty string"))
		While (_.it("is at the end"))
			_.scanner:=cs.Scanner.new("")
			_.expect(_.scanner.eos()).to(_.beTrue()) // or ASSERT(_.scanner.eos();_.message())
		End while 
	End while 
	...
```
If test failed, the message will be : `"A new Scanner for an empty string is at the end"`

You can share some initialization code using `beforeEach` (resp. `afterEach`)

```4d
	...
	While (_.describe("for a non-empty string"))
		
		_.beforeEach(Formula(This.scanner:=cs.Scanner.new("a b c")))
		
		While (_.describe("scan"))
			
			While (_.describe("when the RegExp matches the entire string"))
				While (_.it("returns the entire string"))
					_.expect(_.scanner.scan("a b c")).to(_.beEqualTo(_.scanner.string))
					_.expect(_.scanner.eos()).to(_.beTrue())
				End while 
			End while 
						
			While (_.describe("when the RegExp matches at index 0"))
				While (_.it("returns the portion of the string that matched"))
					_.expect(_.scanner.scan("a")).to(_.beEqualTo("a"))
					_.expect(_.scanner.pos).to(_.beEqualTo(1))
				End while 
			End while 

		End while // end scan
	End while // for a non-empty for a non-empty
End while // A new Scanner
```

### Matchers

Matchers are heavily inspired by [RSpec built-in-matchers](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)

```4d
_.expect(<value>).to(_.<predicate>)
```

or to inverse the predicate

```4d
_.expect(<value>).notTo(_.<predicate>)
_.expect(<value>).toNot(_.<predicate>)
```

with:

- `value`: result of your computations to check
- `predicate`: a defined predicate such as `equal`, `contain`, etc...

#### Equality 

Check if an element is equal

```4d
_.expect(1+1).to(_.beEqualTo(2))
```

#### String

Check if a string contain an other string

```4d
_.expect("seahorse").to(_.contain("sea"))
_.expect("seahorse").to(_.beginWith("sea"))
_.expect("seahorse").to(_.endWith("horse"))
```

#### Collections

Check if collection contain an element

```4d
_.expect(New collection("Atlantic";"Pacific";"Mississippi")).to(_.contain("Mississippi"))
_.expect(New collection("Atlantic";"Pacific")).toNot(_.contain("Mississippi"))
```

or check if all elements match an other matcher

```4d
_.expect(New collection(1;2;3;4)).to(_.allPass(_.beLessThan(5)))
```

or use a formula to check if one element match it

```4d
_.expect(New collection("Atlantic";"Pacific")).to(_.containElementSatisfying(Formula(Position("A";This.value)=1)))
```

#### Nullity

Check if null or not

```4d
_.expect(Null).to(_.beNull())
_.expect("Null").notTo(_.beNull())
```

#### Emptiness

Check if string, object or collection are empty

```4d
_.expect("").to(_.beEmpty())
_.expect("test").toNot(_.beEmpty())
_.expect(New collection("a")).toNot(_.beEmpty())
_.expect(New object()).to(_.beEmpty())
```

#### Length

Check the string or collection length

```4d
_.expect("test").to(_.haveLength(4))
_.expect(New collection("a")).toNot(_.haveLength(1))
```

#### True or False or contain True or False element

Check if `True` or `False` 

```4d
_.expect(True).to(_.beTrue())
_.expect(False).to(_.beFalse())
```

or if any collection or object contain `True` or `False` element

```4d
_.expect(True).to(_.beTruthy())
_.expect(New object("message";"Test";"success";True)).to(_.beTruthy())
_.expect(New collection("Test";True)).to(_.beTruthy())

_.expect(False).to(_.beFalsy())
_.expect(New object("message";"Test";"success";False)).to(_.beFalsy())
_.expect(New collection("Test";False;5)).to(_.beFalsy())
```

#### Numeric comparison

Compare your numeric result with other numerics

```4d
_.expect(1).to(_.beLessThan(2))
_.expect(1).to(_.beLessThanOrEqualTo(2))
_.expect(1).to(_.beLessThanOrEqualTo(1))
_.expect(3).to(_.beGreaterThan(2))
_.expect(3).to(_.beGreaterThanOrEqualTo(2))
_.expect(3).to(_.beGreaterThanOrEqualTo(3))
_.expect(3).notTo(_.beGreaterThanOrEqualTo(4))
_.expect(1.2).to(_.beCloseTo(1.1;0.1))
```

#### Error

Wrap using a formula, then check if an assert has been raised. You can match also message or error code

```4d
_.expect(Formula(ASSERT(False;"Raise"))).to(_.raiseError())
_.expect(Formula(ASSERT(False;"Raise"))).to(_.raiseError("Assert failed: Raise"))
_.expect(Formula(ASSERT(False;"Raise"))).to(_.raiseError(-10518))
_.expect(Formula(ASSERT(False;"Raise"))).toNot(_.raiseError("Assert failed: Not same message"))
_.expect(Formula(Application version)).toNot(_.raiseError())
_.expect(Formula(Application version())).to(_.raiseError())
_.expect(Formula(Application version())).to(_.raiseError(59))
_.expect(Formula(Application version())).toNot(_.raiseError(100))
```

#### Class

Check if your object is an instance of specific class

```4d
_.expect($anInstance)).to(_.beAnInstanceOf(cs.MyClass))
```

## TODO

- Custom error collection in _spec.verify Formula
- ...

![Hey, What did you expect?](https://media1.tenor.com/images/da23a7ec6b59647157eb4227ac97ddd7/tenor.gif)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[code-shield]: https://img.shields.io/static/v1?label=language&message=4d&color=blue
[code-top]: https://img.shields.io/github/languages/top/mesopelagique/expect.svg
[code-size]: https://img.shields.io/github/languages/code-size/mesopelagique/expect.svg
[code-url]: https://developer.4d.com/
[release-shield]: https://img.shields.io/github/v/release/mesopelagique/expect
[release-url]: https://github.com/mesopelagique/expect/releases/latest
[license-shield]: https://img.shields.io/github/license/mesopelagique/expect
[license-url]: LICENSE.md
[discord-shield]: https://img.shields.io/badge/chat-discord-7289DA?logo=discord&style=flat
[discord-url]: https://discord.gg/dVTqZHr
