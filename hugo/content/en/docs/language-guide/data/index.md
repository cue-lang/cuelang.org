---
title: Data
weight: 30
draft: false
---

In this section, you will learn the features that CUE ads on top of JSON for
specifying data. It is assumed the user is familiar with JSON.

<!-- TODO:

terminology for structs: **mapping**, map, struct, or object.

-->

## **JSON Superset**

CUE adds functionality to JSON that makes it easier to write for humans to write
data and configurations in general:

- there are `// single line comments`,
- quotes can be omitted for field names without special characters,
- you do not need commas after map fields,
- you can place commas after the last element of a composite type, and
- the outermost curly braces are optional. {{{ TODO "note on embedding" }}}

{{< columns >}}
```{title="in.cue"}
// A doc comment
map: {
	member1: 3 // a line comment
  member2: 4
}
```
{{< columns-separator >}}
```{title="$ cue export in.cue"}
{
    "map": {
        "member1": 3,
        "member2": 4,
    }
}
```
{{< /columns >}}

{{{ reference "json-vs-cue"  }}}

<!-- TODO: Also useful for defining data: embedding, builtins, … -->

### Comments

CUE supports `//`-style comments: any line  Comments are first-class citizens in CUE.

{{< columns >}}
```{title="in.cue"}
// A doc comment
map: {
    member1: 3 // a line comment
    member2: 4
}

```
{{< columns-separator >}}
```{title="$ cue export in.cue"}
{
    "map": {
        "member1": 3,
        "member2": 4,
    }
}
```
{{< /columns >}}

A comment that is directly on a line directly preceding an element, that comment
is called a doc comment. CUE will treat such comments as special and will
associate that comment with this element during computation.

### null, true, and false

The JSON standard does not assign any special meaning to `null` and, as can be
expected, there is no real consistent interpretation of `null` in the wild. To
remain compatible with all these use cases, CUE does not assign any special
meaning to the keyword `null`.

CUE has the same boolean values as JSON, represented by the keywords `true` and
`false`.

## Organizing Configuration

One of CUE's most powerful features is the ability to merge two variants, or
"aspects", of a single configuration into a well-defined and predictable
outcome. This flexibility allows users to break free from the rigidity of some
predefined API structures. It also enables users to split and organize CUE
configurations as desired. This can involve delegating responsibility for
different parts to different owners, with the assurance that the end result will
be the same as if the configuration had been managed as one huge monolith.

### Merging

CUE allows duplicate fields to exist as long as their values are consistent.

This is allowed:

{{< columns >}}
```{title="in.cue"}
a: 1
a: 1

```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
a: 1
```
{{< /columns >}}

This is not:

{{< columns >}}
```{title="in.cue"}
b: 1
b: 2
```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
b: conflicting values 2 and 1:
    in.cue: 1:4
    in.cue: 2:4
```
{{< /columns >}}

The values do not have to be the same to be consistent.
For instance, maps and lists are merged by matching their keys and indexes,
respectively:

{{< columns >}}
```{title="in.cue"}
point: {
    x: 1
}

list: [1, 2, 3]

point: {
    y: 2
}

list: [1, 2, 3, 4]

```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
point: {
    x: 1
    y: 2
}

list: [1, 2, 3, 4]
```
{{< /columns >}}

As can be seen, identical fields do not have to be placed next to each other.

Merging is also used for validation.
More on this in [Schemas](Schemas%20b39455d56fdb433ba9ea59c04a2dcece.md).

### Single-field shorthand

For single-field maps, the curly braces can be omitted:

{{< columns >}}
```{title="in.cue"}
point2: x: 1
point2: y: 2

```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
point2: {
    x: 1
    y: 2
}
```
{{< /columns >}}

One can also combine values with the `&` operator:

{{< columns >}}
```{title="in.cue"}
point3: { x: 1 } & { y: 2 }

```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
point3: {
    x: 1
    y: 2
}
```
{{< /columns >}}

{{< info >}}
Overall, a JSON file can be thought of as a sequence of path value pairs, where
these pairs can be combined in any order or combination without changing the
resulting value.
{{< /info >}}

### Packages

The package directive allows marking two CUE files to be grouped together.
It is placed at the top of a CUE file.
Splitting a configuration across files allows grouping of related aspects and
makes it easier to separate human written versus machine generated content,
among other things.

{{< columns >}}
```{title="fruit.cue"}
package food

cart: {
	apples:  1
	oranges: 3
}
```
```{title="vegetables.cue"}
package food

cart: spinach: 4
```
{{< columns-separator >}}
```{title="$ cue eval :food"}
cart: {
	apples:  1
	oranges: 3
	spinach: 4
}
```
{{< /columns >}}

CUE will evaluate all files belonging to the same package as if the file
contents were contained in one large file, merging identical fields as described
above.  This also means that references

If there are multiple packages in a directory, CUE will default to the package
with the same name as the directory.

[File Organization](File%20Organization%207692931315a445acb9634b91b2b397f0.md)

## **Numeric values**

CUE extends JSON numerals with:

- SI suffixes, such as 5M, and 1.5Ti,
- `_` to separate number groupings, such as `1_000_000`
- hexadecimal numbers `0x51`
- octal numbers `0o755`
- binary numbers `0b0101_0001`

### SI Suffixes

Numbers can have SI suffixes to express large numbers more compactly.  It is
also possible to use a suffix with a fraction, in which case the result gets
rounded down to the nearest whole number.

| Decimal Suffix | Value | Binary Suffix | Value |
| --- | --- | --- | --- |
| 1K | 1000 | 1Ki | 1024 |
| 1M | 1_000_000 | 1Mi | 1_048_576 |
| 1G | 1_000_000_000 | 1Gi | 1_073_741_824 |
| 1T | 1e12 | 1Ti | 1_099_511_627_776 |
| 1P | 1e15 | 1Pi | 1_125_899_906_842_624 |

Note that `k` is written as `K` instead.

{{< columns >}}
```{title="in.cue"}
a: 1_000_000
b: 1M
c: 1Mi
```
{{< columns-separator >}}
```{title="$ cue eval --out json"}
{
    "a": 1000000,
    "b": 1000000,
    "c": 1048576
}
```
{{< /columns >}}

### Numbers with a different base

CUE can represent numbers in bases other than decimal.

| Base | Prefix | Example | Value |
| --- | --- | --- | --- |
| Hexadecimal | 0x | 0xFF | 255 |
| Octal | 0o | 0o10 | 8 |
| Binary | 0b | 0b1111_1111 | 255 |

{{< columns >}}
```{title="in.cue"}
o: 0o755
h: 0x00Dec0de
b: 0b0101_0001
```
{{< columns-separator >}}
```{title="$ cue eval in.cue"}
{
    "o": 493,
    "h": 14598366,
    "b": 81
}
```
{{< /columns >}}

## **String values**

CUE extends JSON strings with:

- multiline strings
- additional escape sequences
- alternate escape sequences

### Multiline strings

A multiline string starts and ends with a `"""`, the latter being on a line by itself.
The string contents are on separate lines between these two.
The whitespace preceding the last `"""` must prefix each non-empty line of the string contents and is stripped from all lines.

```coq
{{{ with sidebyside "en" "composition-operator" }}}
-- in.cue --
msg: """
    Hello World!

    This is a \
    real treat.
    """
-- out.json --
{
    "msg": "Hello World!\n\nThis is a real treat."
}
{{{end}}}
```

{{{ with sidetrack }}}
CUE multiline strings originate from Swift.
{{{end}}}

### Escape sequences

Just like JSON, CUE uses `\` as the escape character.
These are the ones supported in CUE, with a comparison to JSON and Go.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \" | double quote | ✓ | depends |  |
| \' | single quote |  | depends |  |
| \\ | backslash | ✓ | ✓ |  |
| \/ | slash (solidus) | ✓ |  |  |
| \a | alert or bell |  | ✓ |  |
| \b | backspace | ✓ | ✓ |  |
| \f | form feed | ✓ | ✓ |  |
| \n | newline | ✓ | ✓ |  |
| \r | carriage return | ✓ | ✓ |  |
| \t | tab | ✓ | ✓ |  |
| \v | vertical tab |  | ✓ |  |
| \unnnn | 16-bit Unicode | ✓ | ✓ | \u2014 |
| \unnnnnnnn | 32-bit Unicode |  | ✓ | \U00102345 |
| \() | interpolation |  |  | See Templating%20f4e21af73d744a77aa2c91203a8dbe4f.md |

CUE bytes values allow some additional escape sequences.

### Alternate escape sequences

A string literal enclosed with an equal number of hashes on both sides allows the usual escape sequences to appear in text verbatim. A string enclosed in a single pair of hashes uses `\#` as the escape character, instead of `\`. A string enclosed in two hashes uses `\##`, and so on.

```coq
{{{ with sidebyside "en" "composition-operator" }}}
-- in.cue --
a: #"A newline is\#nwritten as "\n"."#

b: ##"Use \#n to write a newline in that case.”##
-- out.json --
{
    "a": "A newline is\nwritten as "\\n"."
    "b": "Use \#n to write a newline in that case."
}
{{{end}}}
```

{{{ with sidetrack }}}
CUE alternate escape sequences originate from Swift.
{{{end}}}

Alternate escape sequences work analogously for multiline strings.

## **Bytes values**

Bytes are similar to strings, but can hold arbitrary bytes instead of just valid Unicode. A bytes value uses single quotes instead of double quotes.
It also supports multi-line notation and alternate escape sequences. Text is encoded as UTF-8.

Two byte strings are equal if they hold the exact same bytes.

### Translation to JSON

JSON does not natively support binary data.
When exporting to JSON, CUE translates it to base64.

```coq
{{{ with sidebyside "en" "bytes-to-json" }}}
-- in.cue --
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
-- out.json --

{{{end}}}
```

### Translation to YAML

CUE translates bytes to the corresponding YAML binary type.

```coq
{{{ with sidebyside "en" "bytes-to-yaml" }}}
-- in.cue --
a: #’A newline is written as \n.’#
b: '''
    sfsf
    ‘’’
-- out.yaml --

{{{end}}}
```

### Escape sequences

Bytes defines the following escape sequences in addition to those defined for string.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \[0-7]{3} | octal number |  | ✓ | \000 |
| \xnn | hex number |  | ✓ | \xff |

<!-- TODO: should we deprecate octal numbers? -->

## Maps **and Fields**

A map associates a value with a given set of keys. Each key-value pair is called a field.

### Field names

A field of a map may have any name that is allowed by JSON.
Double quotes can be omitted if the name is a valid {{{ def "identifier" }}} that
starts with a letter or `$` and otherwise only contains letters, digits, `$` or `_`.
Identifiers may also start with `#` or `_`, in which case the field is a [[Helper fields](Data%201b448a6f417b4e08b2d41b3b33cf2a45.md)](helper field) with special meaning.

```coq
{{{ with sidebyside "en" "field-names-double-quotes" }}}
-- in.cue --
a1:    1
"a-b": 2 // quotes are needed here
$id:   "yipee"
-- out.json --
{{{end}}}
```

Both quoted and unquoted fields in the above form are referred to as regular fields.

When combining two maps, their fields are matched and merged based on their names.
Names of regular fields are considered equal if their string values are equal, regardless of whether the strings are quoted or not.

```coq
{{{ with sidebyside "en" "merging-of-quoted-and-unquoted" }}}
-- in.cue --
a:   x: 1
"a": y: 2
-- out.cue --
{{{end}}}
```

`a: 1` and `"a": 1` mean the same thing.

### Data fields

Regular fields as well as list elements are collectively called data fields.
When converting CUE to data, such as JSON or YAML, only data fields are emitted.

### Helper fields

Unquoted fields that start with a `#` or a single `_` have a special meaning in CUE and are collectively called helper fields.
Helper fields are omitted when converting CUE to data, like to JSON or YAML.

Quoted field names that start with either `#` or `_`, such as `"#foo"` are not special and are just regular fields.
Unquoted field names starting with `__` are reserved by CUE and cannot be used to define helper fields.

Helper fields allow reuse of CUE code when composing larger configurations.
More on this in the [Templating](Templating%20f4e21af73d744a77aa2c91203a8dbe4f.md) section.

It is possible to associate helper fields with scalar types by placing both in curly braces (`{}`).

```coq
{{{ with sidebyside "en" "embedded-scalars" }}}
-- in.cue –
one: {
    1
    #typeName: "int"
}

two: "two"
two: { _,  #typeName: "string" }

three: {
    a: 1
    #typeName: "map"
}
-- out.cue --
{{{end}}}
```

Note for field `two` we need to include a `_` within the map to make things work.
This is because without it `{}` is only compatible with map values.

### Field overview

Fields starting with `#` are also called definitions in CUE.
They are used for defining schemas and APIs, but can also be used for defining data.

Fields starting with `_` are not visible outside of a package and can be used by package writers to hide CUE code from outside users.
Package writers can change these fields without worry that external users will break.

| Prefix | Examples | Field Type | Data | Comment |
| --- | --- | --- | --- | --- |
| letter or $ | a "a" $a
”#a” | data field | Yes | Some applications may assign special meaning to $. It is just a letter to CUE, though. |
| # | #a | definition | No | Visible outside a package. Definitions are often used to define schema, API, or reusable templates. |
| _ | _a | hidden field | No | Not visible outside a package. |
| _# | _#a | hidden definition | No | Like schema, but not visible outside a package. |
| __ | __close, __int | predeclared identifier | No | Reserved for CUE builtin functions and values. |

## **Lists**

CUE lists are identical to JSON lists.

List elements are considered to be a special kind of data field, with elements indexed by their position.

```coq
{{{ with sidebyside "en" "list-example" }}}
-- in.cue --
a: [1, 2]
"a": [1, 2, 3]
-- out.cue --
a: [1, 2, 3]
{{{end}}}
```

<!-- TODO

a: 3: 4 // ok

a:  5: 6 // introduces gap.

<sidebar: CUE has a construct called associative lists which allows redefining how composition works>

<Reference: associative lists>

-->
