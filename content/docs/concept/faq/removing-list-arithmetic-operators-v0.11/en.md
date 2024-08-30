---
title: Removing list arithmetic operators in CUE 0.11
authors: [jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: set up access to CUE v0.11 before release"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

Early versions of the CUE language allowed lists to be used with the arithmetic
operators "`+`" and "`*`".
This feature was removed from the language specification
[several years ago](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/),
and its removal is now being completed in CUE version 0.11.

This FAQ answers some of your questions about this removal,
including **what you must do if you are affected.**

## What's been removed, and how can I tell if my CUE is affected?

**The list arithmetic operators `*`<!-- vim* --> and `+` don't work in CUE
evaluated by the `cue` command and the Go API from version 0.11 onwards.
If `cue vet` evaluates your CUE successfully then it isn't affected.**

This CUE no longer works, and must be updated as demonstrated below:
{{{with upload "en" "removed"}}}
-- list-arithmetic.cue --
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{{end}}}

The `*` and `+` operators continue to work as expected in all other situations,
such as numeric arithmetic and string composition.
**They are affected only when used with a list value on their left or right side.**

CUE 0.11 and later report the following error when evaluating CUE that contains
list arithmetic operators:

{{{with script "en" "removed"}}}
! cue vet list-arithmetic.cue
{{{end}}}

## What changes are needed in my CUE?

**Wherever the `*` <!--vim*--> operator is used with a list,
replace the operator with [`list.Repeat`](/go/pkg/list#Repeat).
Wherever `+` is used to combine lists,
replace it with [`list.Concat`](/go/pkg/list#Concat) or a nested `for` loop.
Use `cue fix` to save time.**

In many cases you can use
[`cue fix`]({{< relref "/docs/reference/command/cue-help-fix" >}})
to make these changes automatically -- but only if you are using a `cue`
command at version `v0.11.0-alpha.1` or later.

Here's how to use `cue fix`, given the following CUE that requires updating:

{{{with upload "en" "changes"}}}
-- changes-required.cue --
// "[1, 2, 3] * 2" is no longer valid CUE.
A: [1, 2, 3] * 2

// "[1, 2, 3] + [4, 5, 6]" is no longer valid CUE.
B: [1, 2, 3] + [4, 5, 6]

// "[1, 2, 3] + [4, 5, 6]" can also be rewritten using a nested for loop:
B: [for i in [1, 2, 3] {i}, for i in [4, 5, 6] {i}]

// The operators can still be used, unchanged, to produce number, string, and bytes types.
C: 1 + 2*3.3
D: 2*"O." + 3*"X."
E: 2*'X.' + 3*'O.'
{{{end}}}

`cue fix` updates files in place, and is silent unless it fails to process its inputs:

{{{with script "en" "changes"}}}
cue fix changes-required.cue
{{{end}}}

{{{with _script_ "en" "HIDDEN: changes: move file aside"}}}
mv changes-required.cue .changes-required.cue
{{{end}}}
{{{with upload "en" "changes: updated file"}}}
-- changes-required.cue --
import "list"

// "[1, 2, 3] * 2" is no longer valid CUE.
A: list.Repeat([1, 2, 3], 2)

// "[1, 2, 3] + [4, 5, 6]" is no longer valid CUE.
B: list.Concat([[1, 2, 3], [4, 5, 6]])

// "[1, 2, 3] + [4, 5, 6]" can also be rewritten using a nested for loop:
B: [for i in [1, 2, 3] {i}, for i in [4, 5, 6] {i}]

// The operators can still be used, unchanged, to produce number, string, and bytes types.
C: 1 + 2*3.3
D: 2*"O." + 3*"X."
E: 2*'X.' + 3*'O.'
{{{end}}}
{{{with _script_ "en" "HIDDEN: changes: diff uploaded file"}}}
diff changes-required.cue .changes-required.cue
{{{end}}}

Note that `cue fix` only updates the operators *where they're used with lists*.
Using the operators to emit numbers, strings, or bytes remains valid CUE, and
should not be changed, as with fields `C`, `D`, and `E` in the above example.

The updated CUE evaluates successfully:

{{{with script "en" "changes: cue eval"}}}
cue eval changes-required.cue
{{{end}}}

The `cue fix` command can update CUE files, packages or (by default) the whole of
the current module, but there are some uses of list arithmetic operators that it
can't help with -- as
[demonstrated next]().

## Why do I still get evaluation failures after running `cue fix`?

**`cue fix` can only update the operators where they're used with a literal
list value, such as `[1, 2, 3]`. It can't detect their use with a list
value via a reference - you must update these uses manually.**

The following CUE would not be updated by `cue vet`:

{{{with upload "en" "references: broken"}}}
-- references.cue --
x: [1, 2, 3]
y: [4, 5, 6]

A: x * 2 // Invalid CUE!
B: x + y // Invalid CUE!
{{{end}}}

This file must be
[updated manually]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue)
with the following CUE:

{{{with upload "en" "references: fixed"}}}
#force
-- references.cue --
import "list"

x: [1, 2, 3]
y: [4, 5, 6]

A: list.Repeat(x, 2)
B: list.Concat([x, y])
{{{end}}}

{{{with _script_ "en" "HIDDEN: references: cue vet"}}}
cue vet references.cue
{{{end}}}

## Which versions of CUE don't support list arithmetic operators?

**List arithmetic operators are not supported by all releases and pre-releases
of CUE that have a version string which starts with `v0.11` (or later).**

This includes the 0.11 pre-release alphas (`v0.11.0-alpha...`), the 0.11
release candidates (`v0.11.0-rc...`), and all 0.11 patch releases including
`v0.11.0`, `v0.11.1`, and so on. It also includes all releases that come after
0.11, whatever version number they might be given.
The commands on this page demonstrate the following version of `cue`:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Why are list arithmetic operators being removed?

The commit that removed them from the CUE language specification in 2021
[explained the project's reasoning](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/):

```
List operators are confusing [and unnecessary].

For instance, is the result of [a, ...] + [b, ...] open or closed?
What about [a] + [b, ...]?
```

## Why were list arithmetic operators supported until now?

The CUE project takes its compatibility responsibilities to its users
seriously. A capability that's made available in a released version of CUE (as
list arithmetic operators were) shouldn't be removed the instant that it's
deprecated, even though CUE is still pre-version-1.0 and such an immediate
removal might seem generally allowable under
[semantic versioning guidelines](https://semver.org/#spec-item-5).

Some users might have written working, supported CUE that relied on list
arithmetic operators, so the CUE tooling supported it up to and including
version 0.10 -- which was released over 3½ years after the feature stopped
being mentioned.

This breaking language change isn't based on `language.version` from
`cue.mod/module.cue` because a large amount of time has now passed *without* it
being mentioned in the CUE language specification or official documentation.

## I have a question that isn't answered here

Please join the [CUE community]({{< relref "/community" >}}) on GitHub, Slack,
or Discord -- we'll be happy to help!

## Related content

- {{<linkto/related/reference "command/cue-help-fix" >}}
- {{<linkto/related/reference "command/cue-help-vet" >}}
- Standard library: [`list.Repeat`](/go/pkg/list#Repeat)
- Standard library: [`list.Concat`](/go/pkg/list#Concat)
