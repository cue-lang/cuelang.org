---
title: Removing list arithmetic operators in CUE 0.11
authors: [jpluscplusm]
toc_hide: true
---

In early versions, the CUE language explicitly allowed arithmetic operators
("`+`" and "`*`") to take list arguments.
This feature was removed from the language specification
[several years ago](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/),
and its removal is now being completed in CUE version 0.11.

This FAQ answers some of your questions about what's changed.
All the `cue` command examples shown here use the following pre-release version of CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.0-0.dev.0.20240902110846-1440b9eae7fa
...
```

## What's being removed, and from where?

**The list arithmetic operators `*`<!-- syntax* --> and `+` will stop working
in CUE evaluated by the `cue` command and the Go API.**

This affects these operators **only** when they are used with a list as one or
more of their inputs - they will continue to work as expected in all other
situations (such as numeric arithmetic and string composition). For example:

{{<columns>}}
**This CUE will no longer work:**
{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgbGlzdC1hcml0aG1ldGljLmN1ZQ==" }
$ cue eval list-arithmetic.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
```
{{<columns-separator>}}
**This CUE will continue working as before:**
{{< code-tabs >}}
{{< code-tab name="numbers-strings.cue" language="cue" area="top-left" >}}
C: 1 + 2*3
D: 2*"X." + 3*"O.."
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgbnVtYmVycy1zdHJpbmdzLmN1ZQ==" }
$ cue eval numbers-strings.cue
C: 7
D: "X.X.O..O..O.."
```
{{</columns>}}

## Why are list arithmetic operators being removed?

The commit that removed them from the CUE language specification in 2021
[explained the project's reasoning](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/):

{{<quote>}}
List operators are confusing [and] unnecessary.
For instance, is the result of <code>[a,...]+[b,...]</code> open or closed?
What about <code>[a]+[b,...]</code>?
{{</quote>}}

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

Enough time has now passed *without* it being mentioned in the CUE language
specification or official documentation that we believe we can safely remove
it, as it's unlikely still to be in use.

## Which versions of CUE don't support list arithmetic operators?

Any release or pre-release of CUE that has a version string which *starts* with
`v0.11` or later does not support list arithmetic operators.

This includes the 0.11 pre-release alphas (`v0.11.0-alpha...`), the 0.11
release candidates (`v0.11.0-rc...`), and all 0.11 patch releases including
`v0.11.0`, `v0.11.1`, and so on. It also includes all releases that come after
0.11, whatever version number they might be given.

## What are the replacements for list arithmetic operators?

In all scenarios:

- the "`*`" list operator can be replaced with
  [`list.Repeat()`](/go/pkg/list#Repeat)
- the "`+`" list operator can be replaced with
  [`list.Concat()`](/go/pkg/list#Concat) or a nested `for` loop

Here are some examples:

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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgcmVwbGFjZW1lbnRzLmN1ZQ==" >}}
$ cue eval replacements.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
{{< /code-tab >}}
{{< /code-tabs >}}


## Am I affected?

The easiest way to check if your CUE needs to be updated is to use the `cue`
command:

{{< step stepNumber="1" >}}

**Use CUE v0.10.0 to confirm that your CUE is valid.**

Start by installing and using a previous version of the `cue` command that
**does** support list arithmetic operators (such as
[`v0.10.0`](/releases/v0.10.0)) to check that your CUE evaluates successfully.
Use the [`cue vet`]({{< relref "/docs/reference/command/cue-help-vet" >}})
command on your CUE packages and/or files.

If `cue vet` succeeds, continue with the next step.
If it fails, you *must* first fix any problems with your CUE.
{{< /step >}}

{{< step stepNumber="2" >}}
**Check if CUE 0.11 also views your CUE as being valid.**

Install a version of `cue` that doesn't support list arithmetic operators, such
as FIXME, and run the same `cue vet` command as before.
If your CUE contains list arithmetic operators then you'll see errors like this:

{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2         // Invalid CUE!
B: [1, 2, 3] + [4, 5, 6] // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBsaXN0LWFyaXRobWV0aWMuY3VlIHwgZmFsc2U=" }
$ cue vet list-arithmetic.cue | false
```
{{< /step >}}

## I *am* affected! How can I fix my CUE?

The [`cue fix`]({{< relref "/docs/reference/command/cue-help-fix" >}}) command
can automatically check and update CUE files, packages, and entire modules.
It updates them to use current CUE syntax. Make sure you use a `cue` command of
at least version FIXME -- earlier versions didn't know how to update the list
arithmetic operators.

{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top-left" >}}
A: [1, 2, 3] * 2
B: [1, 2, 3] + [4, 5, 6]
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBsaXN0LWFyaXRobWV0aWMuY3VlCmN1ZSBmaXggbGlzdC1hcml0aG1ldGljLmN1ZQpjYXQgbGlzdC1hcml0aG1ldGljLmN1ZQpjdWUgZXZhbCBsaXN0LWFyaXRobWV0aWMuY3Vl" }
# The file shown above contains invalid CUE:
$ cue vet list-arithmetic.cue

# "cue fix" is silent when it succeeds:
$ cue fix list-arithmetic.cue

# The file has been updated to use current CUE syntax:
$ cat list-arithmetic.cue
import "list"

A: list.Repeat([1, 2, 3], 2)
B: list.Concat([[1, 2, 3], [4, 5, 6]])

# The CUE now evaluates correctly:
$ cue eval list-arithmetic.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
```

There are some scenarios that `cue fix` can't help with.

Specifically, `cue fix` can only replace the `*` and `+` list arithmetic
operators when they're used with literal lists, and not references. In other
words, `cue fix` only updates these operators when they are used *directly*
with list values such as `[1, 2, 3]`.

This means that when the following CUE causes `cue vet` to fail, it must then
be updated manually:

{{< code-tabs >}}
{{< code-tab name="references.cue" language="cue" area="top-left" >}}
x: [1, 2, 3]
y: [4, 5, 6]

// Unsupported list arithmetic operators:
A: x * 2 // Invalid CUE!
B: x + y // Invalid CUE!
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCByZWZlcmVuY2VzLmN1ZQpjdWUgZml4IHJlZmVyZW5jZXMuY3VlCmNhdCByZWZlcmVuY2VzLmN1ZQ==" }
# "cue vet" correctly flags the file as needing an update:
$ cue vet references.cue

# "cue fix" runs successfully ...
$ cue fix references.cue

# ... but "cue fix" didn't perform the updates:
$ cat references.cue
x: [1, 2, 3]
y: [4, 5, 6]

// Unsupported list arithmetic operators:
A: x * 2 // Invalid CUE!
B: x + y // Invalid CUE!
```

## Related content

- {{<linkto/related/reference "command/cue-help-fix" >}}
- {{<linkto/related/reference "command/cue-help-vet" >}}
- Standard library: [`list.Repeat()`](/go/pkg/list#Repeat)
- Standard library: [`list.Concat()`](/go/pkg/list#Concat)
