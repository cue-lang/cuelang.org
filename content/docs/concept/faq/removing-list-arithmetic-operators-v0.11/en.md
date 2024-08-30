---
title: Removing list arithmetic operators in CUE v0.11
authors: [jpluscplusm]
toc_hide: true
---

In early versions, the CUE language explicitly allowed arithmetic operators
("`+`" and "`*`") to take list arguments.
This feature was removed from the language specification
[several years ago](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/172f0060cd405f30c5873b793e44300e1a3588cb%5E%21/),
and its removal is now being completed in CUE version `v0.11`.
This FAQ answers some of your questions about what's changed.

## What's being removed, and from where?

TODO(jcm): The operators `*` and `+` when used with list arguments will stop
working with the CUE evaluator in the `cue` command, and the CUE Go API.

## Why were list arithmetic operators supported until now?

TODO(jcm): Because folks might have had CUE that used this syntax, but enough
time has now passed without it being mentioned on cuelang.org or the CUE
language spec that we can assume it's not being used by anyone.

## What's the replacement for list arithmetic operators?

TODO(jcm): list.Repeat(), list.Concat(), and nested for loops. Show examples.

## Which version of CUE removes list arithmetic operators?

TODO(jcm): any version that starts `v0.11`.

## Am I affected?

TODO(jcm): probably not. FIXME: how to check?

## I *am* affected! How can I fix my CUE?

TODO(jcm): `cue fix` examples. Manual fixup examples.
