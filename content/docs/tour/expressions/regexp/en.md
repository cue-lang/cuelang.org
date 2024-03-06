---
title: Regular expressions
weight: 70
---

The operators `=~` and `!~` check values against **regular expressions**.

The expression `a =~ b` is true if the value of **`a`** matches the regular expression **`b`**.\
`a !~ b` is true if the value of **`a`** does _not_ match the regular expression **`b`**.

Just like comparison operators (such as `<` and `>=`) can be used to define
[bounds]({{< relref "docs/tour/types/bounds" >}}),
the regular expression operators may also be used to define a set of strings
through their unary forms.

{{{with code "en" "tour"}}}
exec cue eval -ic file.cue
cmp stdout out
-- file.cue --
fooBar:  "foo bar" =~ "^[a-z ]{1,100}$"
bazQuux: "baz Quux" !~ "[A-Z]"

#lowercaseLength3: =~"^[a-z]{3}$"
#noNumbers:        !~"[0-9]"

foo:       "foo" & #lowercaseLength3
BAR:       "BAR!!!" & #lowercaseLength3
theAnswer: "42" & #noNumbers
-- out --
fooBar:    true
bazQuux:   false
foo:       "foo"
BAR:       _|_ // BAR: invalid value "BAR!!!" (out of bound =~"^[a-z]{3}$")
theAnswer: _|_ // theAnswer: invalid value "42" (out of bound !~"[0-9]")
{{{end}}}

Further details of CUE's regular expression support can be found in the
[`regexp`](https://pkg.go.dev/cuelang.org/go/pkg/regexp#pkg-overview)
package documentation.\
CUE supports the [RE2](https://golang.org/s/re2syntax) regular expression syntax.
