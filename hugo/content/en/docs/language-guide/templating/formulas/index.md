---
title: Formuals
weight: 20
draft: false
---

Formulas compute values from other values.

## Numbers

Unlike most programming languages, CUE represents numbers as decimal numbers.
This means numbers behave the way humans expect it
and it makes CUE an excellent choice for financial modeling.

CUE supports the usual arithmetic operators: addition (`+`), subtraction (`-`), multiplication (`*`) and division (`/`).
Multiplication and division bind stronger than addition and subtraction.
Otherwise the order is left-to-right.
Parenthesis can be used to force computations to be done in a certain order.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: 1 + 2
s: 2 - 1
m: 1.5 * 2
d: 7.0 / 4

p: (1 + 2) * 3

// Precision is preserved.
price: 3.00 * 2
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
a:     3
s:     1
m:     3.0
d:     1.75
p:     9
price: 6.00
{{< /code-tab >}}
{{< /code-tabs >}}

CUE distinguishes whole numbers as a special class of numbers.
For `+`, `-`, and `*` the result is whole, or an integer, if the values on which it operates are whole.
This is not true for the numeric `/` division.

Some applications require integer division.
CUE provides division-related builtins for integers that do have this property.

For two integer values `x` and `y`,
the integer quotient `q = div(x, y)` and remainder `r = mod(x, y)`
implement Euclidean division and satisfy the following relationship:

```
r = x - y*q  with 0 <= r < |y|
```

where `|y|` denotes the absolute value of `y`.

For two integer values `x` and `y`,
the integer quotient `q = quo(x, y)` and remainder `r = rem(x, y)`
implement truncated division and satisfy the following relationship:

```
x = q*y + r  and  |r| < |y|
```

with `quo(x, y)` truncated towards zero.

A zero divisor in either case results in bottom (an error).

| x | y | div(x, y) | mod(x, y) | quo(x, y) | rem(x, y) |
| --- | --- | --- | --- | --- | --- |
| 5 | 3 | 1 | 2 | 1 | 2 |
| -5 | 3 | -2 | 1 | -1 | -2 |
| 5 | -3 | -1 | 2 | -1 | 2 |
| -5 | -3 | 2 | 1 | 1 | -2 |

## String and Bytes Expressions

Two Strings, as well as two bytes, can be appended using the `+` operator.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: "foo" + "bar"
b: '\xE2\x84' + '\x9A'
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
a: "foobar"
b: 'ℚ'
{{< /code-tab >}}
{{< /code-tabs >}}

## String and Bytes Interpolations

Both strings and bytes also support {{{def "interpolations"}}}, which allow inserting values in place using the `\( formula )` notation.

{{{with sidetrack "interpolation-syntax-ethymology"}}}
The `\()` syntax was chosen as this is invalid JSON, which makes it unambiguous when a string is meant to be a constant JSON string, versus an interpolation.
The more common `${}` notation does not have this property and would make interpreting JSON strings ambiguous.
{{{end}}}

Numbers convert to their string representation when inserted.
Strings render as UTF-8 when inserted in bytes.
Bytes are interpreted as UTF-8 when inserted into strings,
whereby invalid characters are converted to the replacement character (`\uFFFD`)
according to Unicode guidelines.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: 1
b: "a plus one: \(a+1)"

clipped: '\xE2\x84' // A clipped codepoint
s:       "As a string: \(clipped+'\x9A')"
e:       "As a string: \(clipped)"
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
a:       1
b:       "a plus one: 2"
clipped: '\xe2\x84'
s:       "As a string: ℚ"
e:       "As a string: �"
{{< /code-tab >}}
{{< /code-tabs >}}

Interpolations may also be used in quoted selectors or in field names.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
f: "foo"
x: "\(f)bar": 1
y: x."\(f)bar"
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

## Comparison

CUE has several comparison operators,
which compare two values and report the result as `true` or `false`.

| Op | Meaning | Op | Meaning |
| --- | --- | --- | --- |
| == | equal | != | not equal |
| <= | less or equal | < | less |
| >= | greater or equal | > | greater |

The ordering operators `<`, `<=`, `>`, and `>=` apply only to numbers, strings, and bytes.

- Numbers are ordered in the usual way. Precision and type are ignored.
- Strings are ordered lexically by Unicode character.
- Bytes are ordered lexically byte-wise.

Helper fields associated with such fields are ignored.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: 1 <= 2
b: 1.0 < 1.01
c: 1.0 < 1
d: "ab" < "b"
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
a: true
b: true
c: false
d: true
{{< /code-tab >}}
{{< /code-tabs >}}

The equality operators `==` and `!=` are defined for any two concrete values.

For instance, `null`, `false`, `"str"`, `1`, and `'\x80'` are comparable, `int` or `<10` are not.

{{{with sidetrack "en"}}}
We have not introduced bounds and types yet, but for now it suffices to say that they exist and are not concrete.
{{{end}}}

Lists are concrete if all elements are concrete and two lists are equal if all elements match.
Maps are concrete if all data fields have concrete values and two maps are equal if they have the same set of data fields with matching values.

{{{with sidetrack "not-counting-constraints"}}}
Field constraints do not have to be concrete as they only apply in the presence of an actual field.
{{{end}}}

Helper fields, like `#foo` and `_foo` are ignored for comparison.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: 1 != 2
b: 1.0 == 1.000
c: 1 == 1.000
d: "ab" == "b"
e: true != false
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
a: true
b: true
c: true
d: false
e: true
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO

We could consider `===` for structural equivalence

-->

## Regular expressions

Regular expressions match text according to some pattern.

CUE supports two comparison operators specifically for regular expressions:

- `re =~ s` is true if `s` is a string matched by regular expression `re`.
- `re !~ s` is true if `s` is a string _not_ matched by regular expression `re`.

CUE supports the regular expression syntax supported by RE2 defined here:

[https://github.com/google/re2/wiki/Syntax](https://github.com/google/re2/wiki/Syntax).

{{{with sidetrack "regexp-limitations-reasons"}}}
RE2 was chosen as the implementation for regular expressions as it has better runtime behavior,
which makes it more likely to do static analysis on such regular expressions and
improves security.
Regular expressions often contain escape sequences.
Using alternate escape sequences is the easiest way to work around double escaping.
{{{end}}}

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
str: "The cat sat in the tree."

match: str =~ "cat"
whole: str =~ "^cat$"
neg:   str !~ "^cat$"

upper: "Cat" =~ #"^\p{Lu}"#
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
str:   "The cat sat in the tree."
match: true
whole: false
neg:   true
upper: true
{{< /code-tab >}}
{{< /code-tabs >}}

## Boolean logic

CUE supports not (`!`), logical and (`&&`), and logical or (`||`) to operate on boolean values.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
n: !true
o: false || true
a: false && true
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
n: false
o: true
a: false
{{< /code-tab >}}
{{< /code-tabs >}}

It is an error for any values passed to these operators to be invalid.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: {}
err: true || a.bar
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" area="top-right" type="terminal" >}}
err: undefined field: bar:
    ./in.cue:2:16
{{< /code-tab >}}
{{< /code-tabs >}}

## Functions

CUE supports a library of useful functions for all kinds of purposes.
Documentation for the standard library can be found here: [https://pkg.go.dev/cuelang.org/go/pkg](https://pkg.go.dev/cuelang.org/go/pkg).

{{{with sidetrack "piggyback-pkg-doc"}}}
We currently piggyback off of Go's documentation generation.
We intend to provide our own to give a better user experience.
{{{end}}}

Use the import directive to use a standard library in your CUE code.
The library can then be accessed by its name.
It can optionally be renamed if it clashes with names in your program.
Some packages also provides constants.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
import (
	"math"
	pathpkg "path"
)

path:  "path/to/dir"
split: pathpkg.Split(path)

sqrt: math.Sqrt(2)
pi:   math.Pi
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
path: "path/to/dir"
split: ["path/to/", "dir"]
sqrt: 1.4142135623730951
pi:   3.14159265358979323846264338327950288419716939937510582097494459
{{< /code-tab >}}
{{< /code-tabs >}}

<!--

Core Builtins
Built-in functions are predeclared. They are called like any other function.

Core builtins can be used without importing a package using either their name, or their name prefixed with `__`.
As CUE disallows field identifiers starting with `__`, the latter will never be shadowed.

`len(bytes | [] | {}): uint`

`len` computes the length for various kind of types.

- For bytes it returns the number of bytes.
- For lists it returns the number of elements.
- For maps it returns the number of data fields.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: len({a: 1, _b: 2}) // hidden fields do not count
b: len([1, 2, 3])
c: len(`abc`)

{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

-->

<!--

splitting
cyclic only when splitting.
Kubernetes and hashicorp
mod1.A -> mod2.B -> mod1.C

-->

<!--

Should we allow the implicit import of “std”? This still doesn’t circumvent the shadowing issue, but may be clearer.

std.default(1, int)

`default(a: _, b: _): (*(a & b) | b)`

`default`: default values

CUE templates allow specifying default values.
For instance, specifies a default integral`1`, one could write

A disjunction allows marking its elements as default with an asterisk.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: int
a: *1
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" area="top-right" type="terminal" >}}
{{< /code-tab >}}
{{< /code-tabs >}}


{{{with sidetrack}}}
Under the hood `default(a)` is rewritten to `*a | _` and `default(a, b) is rewritten to `*(a & b) | b`.
Both rewrites are a specific use of a CUE {{{reference "enum"}}} with default marker.
The term `a & b` is to ensure that the default value is of type `b`.
For instance, the value `1` can be interpreted as both a `number` or an `int`.
{{{end}}}
-->

