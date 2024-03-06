---
title: "Regular expressions"
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
these operators may also be used as unary versions to define a set of strings.

{{{with code "en" "regexp"}}}
exec cue eval -ic regexp.cue
cmp stdout result.txt
-- regexp.cue --
fooBar:  "foo bar" =~ "^[a-z ]{1,100}$"
bazQuux: "baz Quux" !~ "[A-Z]"

#lowercaseLength3: =~"^[a-z]{3}$"
#noNumbers:        !~"[0-9]"

foo:       "foo" & #lowercaseLength3
BAR:       "BAR!!!" & #lowercaseLength3
theAnswer: "42" & #noNumbers
-- result.txt --
fooBar:    true
bazQuux:   false
foo:       "foo"
BAR:       _|_ // BAR: invalid value "BAR!!!" (out of bound =~"^[a-z]{3}$")
theAnswer: _|_ // theAnswer: invalid value "42" (out of bound !~"[0-9]")
{{{end}}}
