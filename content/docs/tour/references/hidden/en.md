---
title: "Hidden Fields"
weight: 7
---

A non-quoted field name that starts with an underscore (`_`) is not
emitted from the output.
To include fields in the configuration that start with an underscore
put them in quotes.

Quoted and non-quoted fields share the same namespace unless they start
with an underscore.

{{{with code "en" "hidden"}}}
-- in.cue --
"_foo": 2
_foo:   3
foo:    4
_#foo:  5
-- out.json --
{
    "_foo": 2,
    "foo": 4
}
{{{end}}}
