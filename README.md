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
_ .expect(<actual>).to(_ .<predicate>(<expected>))
```

With:

- `actual`: result of your computations (in unit test, value to test)
- `predicate`: a defined predicate such as `equal`, `contain`, etc...
- `expected`: value(s) associated to the predicate

### Examples

```4d
_ .expect(1+1).to(_ .beEqualTo(2))
```

#### String

```4d
_ .expect("seahorse").to(_ .contain("sea"))
```

#### Collections

```4d
_ .expect(New collection("Atlantic";"Pacific";"Mississippi")).to(_ .contain("Mississippi"))
_ .expect(New collection("Atlantic";"Pacific")).toNot(_ .contain("Mississippi"))
```

#### Null or not

```4d
_ .expect(Null).to(_ .beNull())
_ .expect("Null").notTo(_ .beNull())
```

#### True or False or contain True or False element

```4d
_ .expect(True:C214).to(_ .beTrue())
_ .expect(False:C215).to(_ .beFalse())

_ .expect(True:C214).to(_ .beTruthy())
_ .expect(New object("message";"Test";"success";True)).to(_ .beTruthy())
_ .expect(New collection("Test";True)).to(_ .beTruthy())

_ .expect(False:C215).to(_ .beFalsy())
_ .expect(New object("message";"Test";"success";False)).to(_ .beFalsy())
_ .expect(New collection("Test";False;5)).to(_ .beFalsy())
```

#### Numeric comparaison

```4d
_ .expect(1).to(_ .beLessThan(2))
_ .expect(1).to(_ .beLessThanOrEqualTo(2))
_ .expect(1).to(_ .beLessThanOrEqualTo(1))
_ .expect(3).to(_ .beGreaterThan(2))
_ .expect(3).to(_ .beGreaterThanOrEqualTo(2))
_ .expect(3).to(_ .beGreaterThanOrEqualTo(3))
_ .expect(3).notTo(_ .beGreaterThanOrEqualTo(4))
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
