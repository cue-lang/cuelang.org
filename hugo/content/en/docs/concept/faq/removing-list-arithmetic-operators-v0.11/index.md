---
title: Removing list arithmetic operators in CUE 0.11
authors: [jpluscplusm]
tags: [language]
toc_hide: true
---

This guide answers some questions about a language change that happened in CUE
version 0.11 -- including how to tell if the change affects your CUE, and how
to update any CUE that's affected.

## What's changed, and how can I tell if my CUE is affected?

From version 0.11 onwards, the list arithmetic operators `*` and `+` don't work
in CUE evaluated by the `cue` command and the Go API.
Your CUE is not affected if a 0.11 version of `cue vet` evaluates it successfully.

This CUE no longer works, and must be updated as
[demonstrated below]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue):

{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}

The `*` and `+` operators continue to work as expected in all other situations,
such as numeric arithmetic and string composition.
They are **only** affected by this change if they are used with a list value on
their left or right side.

CUE versions 0.11 and later report the following errors when evaluating CUE
that contains list arithmetic operators:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBsaXN0LWFyaXRobWV0aWMuY3Vl" }
$ cue vet list-arithmetic.cue
A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
    ./list-arithmetic.cue:1:4
B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
    ./list-arithmetic.cue:2:4
```

## What changes are needed in my CUE?

- Wherever the `*` <!--vim*--> operator is used with a list:
  use [`list.Repeat`](/go/pkg/list#Repeat) instead.
- Wherever the `+` operator is used to combine lists:
  use either [`list.Concat`](/go/pkg/list#Concat) or a nested `for` loop instead.
- Use [`cue fix`]({{< relref "/docs/reference/command/cue-help-fix" >}}) to try
  and make the changes automatically.

[`cue fix`]({{< relref "/docs/reference/command/cue-help-fix" >}})
will make these changes for you in many cases, but only if you are using `cue`
command version\
`v0.11.0-alpha.1` or later. Here's how to use `cue fix`:

Start with some CUE that requires changes because it uses list arithmetic operators:

{{< code-tabs >}}
{{< code-tab name="changes-required.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

Use `cue fix` to update files, packages, or entire modules.
The command is silent unless it fails to process its inputs:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGZpeCBjaGFuZ2VzLXJlcXVpcmVkLmN1ZQ==" }
$ cue fix changes-required.cue
```

`cue fix` updates its inputs in place, rewriting files on disk:
{{< code-tabs >}}
{{< code-tab name="changes-required.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
## Why do I still get evaluation failures after running `cue fix`?

`cue fix` can only update CUE where the list arithmetic operators are used with
a literal list value (e.g. `[1, 2, 3]`). The command can't detect when they
are used with a list value via a reference -- you must update these uses
manually, for the time being.

The following CUE would not be updated by `cue fix`:

{{< code-tabs >}}
{{< code-tab name="references.cue" language="cue" area="top-left" >}}
// This file contains invalid CUE.
x: [1, 2, 3]
y: [4, 5, 6]

A: x * 2 // Invalid use of the "*" operator with a list reference.
B: x + y // Invalid use of the "+" operator with two list references.
{{< /code-tab >}}{{< /code-tabs >}}

This file must be
[manually updated]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue)
with the following CUE:

{{< code-tabs >}}
{{< code-tab name="references.cue" language="cue" area="top-left" >}}
import "list"

x: [1, 2, 3]
y: [4, 5, 6]

A: list.Repeat(x, 2)
B: list.Concat([x, y])
{{< /code-tab >}}{{< /code-tabs >}}
## Why are list arithmetic operators being removed?
<!-- TODO(jcm): move to a separate page, cf https://cuelang.org/cl/1200357/comment/9a648a4e_2a2d2c90/ -->

Early versions of the CUE language allowed lists to be used with the arithmetic
operators "`+`" and "`*`". This feature was removed from the language specification
[some years ago](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/),
with the removal being completed in CUE version 0.11.

The commit that removed them from the CUE language specification in 2021
explained the project's rationale:

```
List operators are confusing [and unnecessary].

For instance, is the result of [a, ...] + [b, ...] open or closed?
What about [a] + [b, ...]?
```

## Why were list arithmetic operators supported until now?
<!-- TODO(jcm): move to a separate page, cf https://cuelang.org/cl/1200357/comment/9a648a4e_2a2d2c90/ -->

The CUE project takes its compatibility responsibilities to its users
seriously. A capability that's made available in a released version of CUE (as
list arithmetic operators were) shouldn't be removed the instant that it's
deprecated, even though CUE is still pre-version-1.0 and such an immediate
removal might seem generally allowable under
[semantic versioning guidelines](https://semver.org/#spec-item-5).

Users might have written CUE that relied on list arithmetic operators, so
the CUE tooling supported this feature up to and including version 0.10 --
which was released over 3½ years after the feature stopped being mentioned.

This breaking language change isn't based on `language.version` from
`cue.mod/module.cue` because a significant length of time has now passed
without the feature being mentioned in the CUE language specification or
official documentation.

## I have a question that isn't answered here

Please join the [CUE community]({{< relref "/community" >}}) on GitHub, Slack,
or Discord and ask the question there -- we'll be happy to help!

## Related content

- {{<linkto/related/reference "command/cue-help-fix" >}}
- {{<linkto/related/reference "command/cue-help-vet" >}}
- Standard library: [`list.Repeat`](/go/pkg/list#Repeat)
- Standard library: [`list.Concat`](/go/pkg/list#Concat)
