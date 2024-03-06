---
title: Regular expressions
weight: 70
---

The `=~` and `!~` operators check values against **regular expressions**.

{{< table >}}
| Expression | is true ... |
| ---:|:--- |
| **`a =~ b`** | ... if **`a`** matches the regular expression **`b`** |
| **`a !~ b`** | ... if **`a`** does *not* match the regular expression **`b`** |
{{< /table >}}

Just like comparison operators (such as `<` and `>=`) can be used to define
[bounds]({{< relref "docs/tour/types/bounds" >}}),
the regular expression operators may also be used to define a set of strings
through their unary forms.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
fooBar:  "foo bar" =~ "^[a-z ]{1,100}$"
bazQuux: "baz Quux" !~ "[A-Z]"

#lowercaseLength3: =~"^[a-z]{3}$"
#noNumbers:        !~"[0-9]"

foo:       "foo" & #lowercaseLength3
BAR:       "BAR!!!" & #lowercaseLength3
theAnswer: "42" & #noNumbers
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWljIGZpbGUuY3Vl" >}}
$ cue eval -ic file.cue
fooBar:    true
bazQuux:   false
foo:       "foo"
BAR:       _|_ // BAR: invalid value "BAR!!!" (out of bound =~"^[a-z]{3}$")
theAnswer: _|_ // theAnswer: invalid value "42" (out of bound !~"[0-9]")
{{< /code-tab >}}
{{< /code-tabs >}}
