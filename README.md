# expect
[![language][code-shield]][code-url]
[![language-top][code-top]][code-url]
![code-size][code-size]
[![release][release-shield]][release-url]
[![license][license-shield]][license-url]

Matchers component inspired by [RSpec expectations](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)

## Usage

```4d
_ = spec // shared method of component
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

### Examples

```4d
_.expect(1+1).to(_.beEqualTo(2))
```

#### String

```4d
_.expect("seahorse").to(_.contain("sea"))
_.expect("seahorse").to(_.beginWith("sea"))
_.expect("seahorse").to(_.endWith("horse"))
```

#### Collections

```4d
_.expect(New collection("Atlantic";"Pacific";"Mississippi")).to(_.contain("Mississippi"))
_.expect(New collection("Atlantic";"Pacific")).toNot(_.contain("Mississippi"))

_.expect(New collection(1;2;3;4)).to(_.allPass(_.beLessThan(5)))
_.expect(New collection("Atlantic";"Pacific")).to(_.containElementSatisfying(Formula(Position("A";This.value)=1)))
```

#### Null or not

```4d
_.expect(Null).to(_.beNull())
_.expect("Null").notTo(_.beNull())
```

#### Emptiness

```4d
_.expect("").to(_.beEmpty())
_.expect("test").toNot(_.beEmpty())
_.expect(New collection("a")).toNot(_.beEmpty())
_.expect(New object()).to(_.beEmpty())
```

#### Length

```4d
_.expect("test").to(_.haveLength(4))
_.expect(New collection("a")).toNot(_.haveLength(1))
```

#### True or False or contain True or False element

```4d
_.expect(True).to(_.beTrue())
_.expect(False).to(_.beFalse())

_.expect(True).to(_.beTruthy())
_.expect(New object("message";"Test";"success";True)).to(_.beTruthy())
_.expect(New collection("Test";True)).to(_.beTruthy())

_.expect(False).to(_.beFalsy())
_.expect(New object("message";"Test";"success";False)).to(_.beFalsy())
_.expect(New collection("Test";False;5)).to(_.beFalsy())
```

#### Numeric comparaison

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

#### Class

```4d
_.expect($anInstance)).to(_.beAnInstanceOf(cs.MyClass))
```

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
