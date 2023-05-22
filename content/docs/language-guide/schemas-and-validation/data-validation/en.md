---
title: Data Validation
weight: 70
draft: false
---

Schema can compose with data, for instance to validate data.
For instance, this is valid:

```coq
{{{with sidebyside "en" "schema-composed-with-data"}}}
-- in.cue --
a:  1
a?: int
-- out.cue --
a: 1
{{{end}}}
```

This is not

```coq
{{{with sidebyside "en" "schema-composed-with-data-error"}}}
# Right-hand side is red because of error.
-- in.cue --
a:  1
a?: string
-- out.err --
a: conflicting values 1 and string (mismatched types int and string):
    ./in.cue:1:5
    ./in.cue:2:5
{{{end}}}
```

It is also possible to combine schemas. For instance, the following CUE defines
restrictions on what values are allowed for another schema.

```coq
{{{with sidebyside "en" "to-be-completed"}}}
-- in.cue --

-- out.cue --

{{{end}}}
```

The result is a schema that is more strict for validating data.

<--

Also of interest:.

Validating JSON with CUE.

-->
