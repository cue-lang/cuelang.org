---
title: Organizing Configuration
weight: 20
draft: true
---

One of CUE's most powerful features is the ability to merge two variants, or
"aspects", of a single configuration into a well-defined and predictable
outcome. This flexibility allows users to break free from the rigidity of some
predefined API structures. It also enables users to split and organize CUE
configurations as desired. This can involve delegating responsibility for
different parts to different owners, with the assurance that the end result will
be the same as if the configuration had been managed as one huge monolith.

## Merging

CUE allows duplicate fields to exist as long as their values are consistent.

This is allowed:

{{{with code "en" "composition-simple-success"}}}
-- in.cue --
a: 1
a: 1
-- out.cue --
a: 1
{{{end}}}

This is not:

{{{with code "en" "composition-simple-error"}}}
#norun
-- in.cue --
b: 1
b: 2
-- out.cue --
b: conflicting values 2 and 1:
    in.cue: 1:4
    in.cue: 2:4
{{{end}}}

Two maps or lists are consistent if the values with the same key or index are
consistent.

{{{with code "en" "composition-composite"}}}
#norun open lists
-- in.cue --
point: {
	x: 1
}

list: [1, 2, 3]

point: {
	y: 2
}

list: [1, 2, 3, 4]
-- out.cue --
point: {
    x: 1
    y: 2
}

list: [1, 2, 3, 4]
{{{end}}}

As can be seen, identical fields do not have to be placed next to each other.

Merging is also used for validation.
More on this in
[Schemas and Validation]({{< relref "docs/language-guide/schemas-and-validation" >}}).

## Single-field shorthand

For single-field maps, the curly braces can be omitted:

{{{with code "en" "composition-single-field-map"}}}
-- in.cue --
point2: x: 1
point2: y: 2
-- out.cue --
point2: {
    x: 1
    y: 2
}
{{{end}}}

One can also combine values with the `&` operator:

{{{with code "en" "composition-operator"}}}
-- in.cue --
point3: {x: 1} & {y: 2}
-- out.cue --
point3: {
    x: 1
    y: 2
}
{{{end}}}

{{{with sidetrack}}}
Overall, a JSON file can be thought of as a sequence of path value pairs, where
these pairs can be combined in any order or combination without changing the
resulting value.
{{{end}}}

### Packages

The package directive allows marking two CUE files to be grouped together.
It is placed at the top of a CUE file.
Splitting a configuration across files allows grouping of related aspects and
makes it easier to separate human written versus machine generated content,
among other things.

{{{with code "en" "packages"}}}
exec cue eval :food
-- fruit.cue --
package food

cart: {
	apples:  1
	oranges: 3
}
-- vegetables.cue --
package food

cart: spinach: 4
-- out.cue --
cart: {
	apples:  1
	oranges: 3
	spinach: 4
}
{{{end}}}

CUE will evaluate all files belonging to the same package as if the file
contents were contained in one large file, merging identical fields as described
above.s This means that references in one file may refer to top-level fields in
another file.

<!-- TODO: add link to references -->

If there are multiple packages in a directory, CUE will default to the package
with the same name as the directory.

[File Organization]({{< relref "docs/language-guide/file-organization" >}})
