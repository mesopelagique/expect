# expect

Matchers component inspired by [RSpec expectations](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)

## Usage

```4d
tu .expect(<actual>).to(tu .<predicate>(<expected>))
```

With 
- `actual`: result of your computations (in unit test, value to test)
- `predicate`: a defined predicate such as `equal`, `contain`, etc...
- `expected`: value(s) associated to the predicate

### Examples

```4d
tu .expect(1+1).to(tu .equal(2))
```

```4d
tu .expect("seahorse").to(tu .contain("sea"))
```

```4d
tu .expect(New collection:C1472("Atlantic";"Pacific";"Mississippi")).to(tu .contain("Mississippi"))
tu .expect(New collection:C1472("Atlantic";"Pacific")).toNot(tu .contain("Mississippi"))
```

```4d
tu .expect(Null:C1517).to(tu .beNull())
tu .expect("Null").notTo(tu .beNull())
```

```4d
tu .expect(True:C214).to(tu .beTrue())
tu .expect(False:C215).to(tu .beFalse())

tu .expect(True:C214).to(tu .beTruthy())
tu .expect(New object:C1471("message";"Test";"success";True:C214)).to(tu .beTruthy())
tu .expect(New collection:C1472("message";"Test";"success";True:C214)).to(tu .beTruthy())

tu .expect(False:C215).to(tu .beFalsy())
tu .expect(New object:C1471("message";"Test";"success";False:C215)).to(tu .beFalsy())
tu .expect(New collection:C1472("message";"Test";"success";False:C215)).to(tu .beFalsy())
```

```4d
tu .expect(1).to(tu .beLessThan(2))
tu .expect(1).to(tu .beLessThanOrEqualTo(2))
tu .expect(1).to(tu .beLessThanOrEqualTo(1))
tu .expect(3).to(tu .beGreaterThan(2))
tu .expect(3).to(tu .beGreaterThanOrEqualTo(2))
tu .expect(3).to(tu .beGreaterThanOrEqualTo(3))
tu .expect(3).notTo(tu .beGreaterThanOrEqualTo(4))
```

#### shortcut

Do not want to use `tu`

```4d
_:=tu
_ .expect(1+1).to(_ .equal(2))
```
