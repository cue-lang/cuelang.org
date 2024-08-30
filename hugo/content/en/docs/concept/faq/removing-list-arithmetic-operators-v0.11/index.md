---
title: Removing list arithmetic operators in CUE 0.11
authors: [jpluscplusm]
toc_hide: true
---

In early versions, the CUE language explicitly allowed lists to be used with
the arithmetic operators "`+`" and "`*`".
This feature was removed from the language specification
[several years ago](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/),
and its removal is now being completed in CUE version 0.11.
This FAQ answers some of your questions about what's changed.

All the `cue` commands shown here use the following pre-release version:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.0-0.dev.0.20240902110846-1440b9eae7fa
...
```

## What's being removed, and from where?

{{<caution>}}
**The list arithmetic operators `*`<!-- vim* --> and `+` don't work in CUE
evaluated by the `cue` command and the Go API from version 0.11 onwards.**
{{</caution>}}

These operators are affected **only** when used with a list value on their left
or right side - they will continue to work as expected in all other situations
(such as numeric arithmetic and string composition).

This CUE no longer works, and must be updated as demonstrated below:
{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}

## Is my CUE affected by this change?

{{<caution>}}
**If your CUE evaluates successfully using version 0.11 of the `cue` command or
Go API, then it is *not* affected. Use `cue vet` to check if updates are required.**
{{</caution>}}

The easiest way to check if your CUE needs to be updated is to use the `cue`
command at version FIXME or later:

{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBtaXNzaW5nLmZpbGUuY3VlIGxpc3QtYXJpdGhtZXRpYy5jdWU=" }
$ cue vet missing.file.cue list-arithmetic.cue
could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory
```

If your CUE evaluates successfully then it's valid and doesn't require any
updates. If it fails to evaluate with error messages like the ones shown above,
then you need to
[update your CUE]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue).

## What changes are needed in my CUE?

{{<caution>}}
**If your CUE suddenly fails to evaluate after upgrading to version 0.11
and displays the error messages
[demonstrated below]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#is-my-cue-affected-by-this-change)
then use the `cue fix` command to
[update it automatically]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#do-i-need-to-update-my-cue-manually);
or manually:**

- Find each instance of `*` being used with lists, and replace it with
  [`list.Repeat()`](/go/pkg/list#Repeat)
- Find each instance of `+` being used to combine lists, and replace it with
  [`list.Concat()`](/go/pkg/list#Concat)
{{</caution>}}

In all cases where they're used with lists:

- the "`*`" list operator should be replaced with
  [`list.Repeat()`](/go/pkg/list#Repeat) from the CUE standard library
- the "`+`" list operator should be replaced with
  [`list.Concat()`](/go/pkg/list#Concat), or a nested `for` loop.

Here's an example of some CUE that uses these standard library functions
instead of list arithmetic operators. Before you start making any manual
changes to your CUE **read the next section**:
["Do I need to update my CUE manually?"]({{< relref "#do-i-need-to-update-my-cue-manually" >}}).

{{< code-tabs >}}
{{< code-tab name="replacements.cue" language="cue" area="top-left" >}}
import "list"

// Rewrite "[1, 2, 3] * 2" like this:
A: list.Repeat([1, 2, 3], 2)

// Rewrite "[1, 2, 3] + [4, 5, 6]" like this:
B: list.Concat([[1, 2, 3], [4, 5, 6]])

// Alternatively, rewrite "[1, 2, 3] + [4, 5, 6]"
// like this:
B: [for i in [1, 2, 3] {i}, for i in [4, 5, 6] {i}]

// The operators can still be used, unchanged,
// to produce number, string, and bytes types.
C: 1 + 2*3.3
D: 2*"O." + 3*"X."
E: 2*'X.' + 3*'O.'
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgcmVwbGFjZW1lbnRzLmN1ZQ==" >}}
$ cue eval replacements.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
C: 7.6
D: "O.O.X.X.X."
E: 'X.X.O.O.O.'
{{< /code-tab >}}
{{< /code-tabs >}}

## Do I need to update my CUE manually?

{{<caution>}}
***Usually* not.
In many cases the `cue fix` command can perform the updates for you automatically.**
{{</caution>}}

The [`cue fix`]({{< relref "/docs/reference/command/cue-help-fix" >}})
command checks CUE files, packages, and entire modules,
and automatically updates them to use current CUE syntax.
This means that you usually don't need to update your CUE by hand.
There are some uses of list arithmetic operators that it can't help with, and
these are demonstrated below.

To apply automatic updates using `cue fix`, make sure you are using a `cue`
command that's at least version FIXME, because earlier versions didn't know how
to update the list arithmetic operators.

{{< step stepNumber="1" >}}

We'll start with the following CUE that includes list arithmetic operators,
and therefore needs to be updated:

{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2
B: [1, 2, 3] + [4, 5, 6]
C: 1 + 2*3.3
D: 2*"O." + 3*"X."
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="2" >}}
We can see that `cue vet` tells us that there's a problem with this CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBtaXNzaW5nLmZpbGUuY3VlIGxpc3QtYXJpdGhtZXRpYy5jdWU=" }
# The file shown above contains invalid CUE:
$ cue vet missing.file.cue list-arithmetic.cue
could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory
```

Running `cue vet` on the file is silent, but this doesn't mean that it manages
to discover *every* use of list arithmetic operators and updates them all - it
just means that `cue vet` is able to process the file without error.
{{< /step >}}

{{< step stepNumber="3" >}}
We run `cue fix` on the file:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGZpeCBsaXN0LWFyaXRobWV0aWMuY3Vl" }
$ cue fix list-arithmetic.cue
```

`cue fix` also accepts package import path arguments.
To process and update every CUE file in the current module, invoke the command without any arguments.
{{< /step >}}

{{< step stepNumber="4" >}}
The updated file now looks like this:
{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
import "list"

A: list.Repeat([1, 2, 3], 2)
B: list.Concat([[1, 2, 3], [4, 5, 6]])
C: 1 + 2*3.3
D: 2*"O." + 3*"X."
{{< /code-tab >}}{{< /code-tabs >}}
Notice that the operators were only updated *where they're used with lists*.
Number- and string-based uses were left intact, as they remain valid CUE and
don't need updating.
{{< /step >}}

{{< step stepNumber="5" >}}
The updated file is now valid, and can be evaluated successfully:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBsaXN0LWFyaXRobWV0aWMuY3VlCmN1ZSBldmFsIGxpc3QtYXJpdGhtZXRpYy5jdWU=" }
$ cue vet list-arithmetic.cue
$ cue eval list-arithmetic.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
C: 7.6
D: "O.O.X.X.X."
```
{{< /step >}}

If `cue vet` still reports problems evaluating your CUE after it has been
updated by `cue fix`, then your CUE is probably using list arithmetic operators
in a way that `cue fix`
[can't detect]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#why-do-i-still-get-evaluation-failures-after-running-cue-fix),
and you'll need to
[update it manually]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue);

## Why do I still get evaluation failures after running `cue fix`?

There are some specific scenarios that `cue fix` can't help with.

`cue fix` can only replace the `*` and `+` list arithmetic operators when
they're used with literal lists, and not references. In other words, `cue fix`
only updates these operators when they are used *directly* with list values
such as `[1, 2, 3]`.

This means that when the following CUE causes `cue vet` to fail, it must then
be updated manually:

{{< code-tabs >}}
{{< code-tab name="references.cue" language="cue" area="top-left" >}}
x: [1, 2, 3]
y: [4, 5, 6]

A: x * 2 // Invalid CUE!
B: x + y // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}

This file needs to be
[updated manually]({{< relref "removing-list-arithmetic-operators-v0.11" >}}#what-changes-are-needed-in-my-cue),
to the following CUE:

{{< code-tabs >}}
{{< code-tab name="references.cue" language="cue" area="top-left" >}}
import "list"

x: [1, 2, 3]
y: [4, 5, 6]

A: list.Repeat(x, 2)
B: list.Concat([x, y])
{{< /code-tab >}}{{< /code-tabs >}}

The updated CUE evaluates successfully:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgcmVmZXJlbmNlcy5jdWU=" }
$ cue eval references.cue
x: [1, 2, 3]
y: [4, 5, 6]
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
```

## Which versions of CUE don't support list arithmetic operators?

{{<caution>}}
**Any release or pre-release of CUE that has a version string which starts with
`v0.11` or later does not support list arithmetic operators.**
{{</caution>}}

This includes the 0.11 pre-release alphas (`v0.11.0-alpha...`), the 0.11
release candidates (`v0.11.0-rc...`), and all 0.11 patch releases including
`v0.11.0`, `v0.11.1`, and so on. It also includes all releases that come after
0.11, whatever version number they might be given.

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
- Standard library: [`list.Repeat()`](/go/pkg/list#Repeat)
- Standard library: [`list.Concat()`](/go/pkg/list#Concat)
