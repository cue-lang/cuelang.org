---
title: Inputs
weight: 10
authors: [jpluscplusm]
toc_hide: false
---

The `cue export` command can be given any number of inputs to evaluate via the
command's positional parameters -- that is, parameters that aren't associated
with and used by some preceding flag. This page explains how the command
interprets, assembles, and combines these inputs when handed different kinds
and quantities of input.

## Zero positional parameters

When `cue` export is invoked with no positional arguments
the input is the single package in the current directory:

{{{with code "en" "cue export # package x1"}}}
exec cue export
cmp stdout out
-- default-input.cue --
package example

A: 1
B: 2.2
C: A + B + 3.33
-- out --
{
    "A": 1,
    "B": 2.2,
    "C": 6.53
}
{{{end}}}

The single package is loaded as a *package instance* -- a concept which is
explained later, on this page.

The command fails if more than one package exists in the current directory
and the input isn't explicitly specified:

{{{with code "en" "! cue export # package x2"}}}
#location left left right
! exec cue export
cmp stderr out
-- package-2.cue --
package two

message: "this is package two"
-- package-1.cue --
package one

message: "this is package one"
-- out --
found packages "one" (package-1.cue) and "two" (package-2.cue) in "."
{{{end}}}

## Positional arguments

Leave a TODO for "how cue finds CUE" or similar; don't write it all here.
--path/-l
--with-context
Placing non-CUE somewhere other than the root.
Leave a TODO for linking to a future --with-context guide.
stdin

### Injecting values

Demo briefly; link to to other guides.

--name/-n

