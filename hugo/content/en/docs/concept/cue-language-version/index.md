---
title: CUE language versions
tags:
- modules
authors:
- rogpeppe
toc_hide: true
---

The `cue.mod/module.cue` file has a mandatory `language.version` field
that sets the language version for a given module. But what does it actually
do? This page explores that question.

Here is an example `module.cue` file:

{{< code-tabs >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="top-left" >}}
module: "cue.example"
language: version: "v0.9.2"
{{< /code-tab >}}{{< /code-tabs >}}

At the time of writing, the latest CUE release is `v0.9.2`, so we can see that
the language version is closely related to the CUE toolchain (`cue` command
or API) version.

The `language.version` field is required for two main reasons. The information that it encodes:

- protects you from using CUE modules that rely on language features
that aren't implemented in the version of CUE you have installed;
- allows the CUE language developers to make changes to the language
that aren't backwards compatible

Let us consider each of these separately.

##  Use of future-versioned code

When the CUE evaluator comes across a module that declares a language version greater
than that of the evaluator itself, it produces an error. This is because it cannot
know what semantics apply to the newer version. Even if the module
does not actually make use of any newer language features, the older version
of the evaluator cannot know that's the case, so the conservative choice is
to produce an error.

As a historical counterpoint, the Go language took a different approach initially:
when it came across a newer version, it _tried_ to compile the code anyway,
optimistically assuming that it might be OK. On failure, it produced an error
message saying that the syntax error "might be due to use of a newer language feature".
CUE does not use that approach for a few reasons:
- the resulting errors are obscure and may well not pinpoint the actual reason for failure,
which may not be anything to do with the language version
- the language change might be subtle enough that it doesn't actually result in an error
- Go deliberately moved away from that approach

## Making backwardly incompatible changes

It's important to be able to move forward with changes to the language, adding
new features, and sometimes deprecating or even removing features.

One example is the way that aliases are defined. Originally, an alias
was defined using this syntax:

```cue
x = 5 // Don't use this old alias syntax!
```

but in more recent CUE versions, this has been changed to:

```cue
 let x = 5
```

If the language were never to be changed in a backwardly incompatible
way, the original syntax would need to be supported forever, but that
would preclude the possibility of moving forward and perhaps
repurposing the `x=5` syntax for other things.

However, having the language version inside the `module.cue` file
provides the CUE language designers with the freedom to both support
the old syntax _and_ to repurpose it for other things by interpreting
the files in a module in the knowledge of the language version
declared for that module.

Specifically the evaluator can see that a module declares an older version
and apply the older syntax or semantics to the files in that module.

This also applies to changes to the `module.cue` schema itself.
Although the CUE developers will strive to avoid making backwardly
incompatible changes, they cannot necessarily foresee future
requirements, so the language version also allows us to make
backwardly incompatible changes to the `module.cue` file syntax.

## How CUE behaves

So how does CUE actually behave when it evaluates modules?

Given an evaluator version E and a module version V:

- if V is after E, the evaluator will fail with an error (module is too new)
- if V is before E, the evaluator will interpret the module as if the evaluator
version as V.

In time, it is likely that support for some old features will be
removed, with plenty of notice given. In that case, if V is a long way
before E, the evaluator may fail instead of interpreting the module as
V.
