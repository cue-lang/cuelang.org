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

## What's being removed, and from where?

**The list arithmetic operators `*`<!-- syntax* --> and `+` will stop working
in CUE evaluated by the `cue` command and the Go API.**  This affects these
operators **only** when they are used with a list as one or more of their
inputs - they will continue to work as expected in all other situations (such
as numeric arithmetic and string composition). For example:

{{<columns>}}
**1) This CUE will no longer work.**
{{< code-tabs >}}
{{< code-tab name="list-arithmetic.cue" language="cue" area="top" >}}
A: [1, 2, 3] * 2
B: [1, 2, 3] + [4, 5, 6]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV2YWwgbGlzdC1hcml0aG1ldGljLmN1ZQ==" >}}
$ cue eval list-arithmetic.cue
A: [1, 2, 3, 1, 2, 3]
B: [1, 2, 3, 4, 5, 6]
{{< /code-tab >}}
{{< /code-tabs >}}
{{<columns-separator>}}
**2) This CUE will continue working as before.**
{{< code-tabs >}}
{{< code-tab name="numbers-strings.cue" language="cue" area="top" >}}
A: 4*2 + 1
B: "abc"*2 + "def"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV2YWwgbnVtYmVycy1zdHJpbmdzLmN1ZQ==" >}}
$ cue eval numbers-strings.cue
A: 9
B: "abcabcdef"
{{< /code-tab >}}
{{< /code-tabs >}}
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

Some users might have written working, supported CUE that uses list arithmetic
operators, so the CUE tooling supported it until version 0.11. Enough time has
now passed without the feature being mentioned in the CUE language
specification (or on cuelang.org) that we can safely remove it as it's believed
unlikely to still be in use by anyone.

## What's the replacement for list arithmetic operators?

TODO(jcm): list.Repeat(), list.Concat(), and nested for loops. Show examples.

## Which version of CUE removes list arithmetic operators?

TODO(jcm): any version that starts `v0.11`.

## Am I affected?

TODO(jcm): probably not. FIXME: how to check?

## I *am* affected! How can I fix my CUE?

TODO(jcm): `cue fix` examples. Manual fixup examples.
