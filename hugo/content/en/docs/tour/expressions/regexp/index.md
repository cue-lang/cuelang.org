---
title: "Regular expressions"
weight: 7
---

The `=~` and `!~` operators can be used to check against regular expressions.

The expression `a =~ b` is true if `a` matches `b`, while
`a !~ b` is true if `a` does _not_ match `b`.

Just as with comparison operators, these operators may be used
as unary versions to define a set of strings.

{{< code-tabs >}}
{{< code-tab name="regexp.cue" language="cue"  area="top-left" >}}
a: "foo bar" =~ "foo [a-z]{3}"
b: "maze" !~ "^[a-z]{3}$"

c: =~"^[a-z]{3}$" // any string with lowercase ASCII of length 3

d: c
d: "foo"

e: c
e: "foo bar"
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
a: true
b: true
c: =~"^[a-z]{3}$"
d: "foo"
e: _|_ // e: invalid value "foo bar" (out of bound =~"^[a-z]{3}$")
{{< /code-tab >}}
{{< /code-tabs >}}
