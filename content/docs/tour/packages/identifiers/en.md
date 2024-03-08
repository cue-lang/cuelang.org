---
title: Identifiers
weight: 30
---

TODO

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
x: 1
-- out --
{
    "x": 1
}
{{{end}}}
