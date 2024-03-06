---
title: Accessing Fields
weight: 20
---

**Selectors** access fields within a struct using dot notation (`.name`) or
indexing notation (`["name"]`).

Dot notation can be used if a field name is
[a valid CUE identifier]({{< relref "docs/reference/spec#identifiers" >}}).

In other cases, including computed references and non-valid identifiers,
indexing notation can be used.

{{{with code "en" "tour"}}}
exec cue export file.cue 
cmp stdout out
-- file.cue --
one:   #n.a & #n["a"] // Equivalent references
two:   #n.b           // Valid identifer
three: #n["c d"]      // Non-valid identifier
four:  #n[#E+"f"]     // Computed reference
five:  #n.#g          // Valid identifier

#E: "e"
#n: {
	a:     1
	"b":   2
	"c d": 3
	ef:    4
	#g:    5
}
-- out --
{
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5
}
{{{end}}}
