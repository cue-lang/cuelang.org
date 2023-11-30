---
title: Alias and reference scopes
authors:
- myitcv
- jpluscplusm
tags:
- user question
toc_hide: true
---

## Question #1

A user asked for help with a problem they were having with their CUE:

{{< quote >}}
Can you help me with <code>problem1.cue</code>? I'm trying to get YAML that
looks like <code>expected.yaml</code>, but instead I end up with these
"incomplete value" errors!
{{< /quote >}}

{{{with code "en" "q1"}}}
! exec cue export problem1.cue --out yaml
cmp stderr out
-- problem1.cue --
#Metadata: {
	name:      string
	namespace: string
}

#BaseConfig: {
	metadata: #Metadata
}

#Config: {
	metadata: #Metadata

	serviceA: #BaseConfig & {
		metadata: metadata
	}

	serviceB: #BaseConfig & {
		metadata: metadata
	}
}

config: #Config & {
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
-- expected.yaml --
config:
  metadata:
    name: test
    namespace: dev
  serviceA:
    metadata:
      name: test
      namespace: dev
  serviceB:
    metadata:
      name: test
      namespace: dev
-- out --
config.serviceA.metadata.name: incomplete value string:
    ./problem1.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./problem1.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./problem1.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./problem1.cue:3:13
{{{end}}}

## Cuelang.org's answer #1

Well, CUE user, your solution sure does look reasonable at first glance!

You're trying to make sure that, inside `config`, both `serviceA` and
`serviceB` contain identical `metadata` fields, and to ensure that these fields
adhere to the constraints of `#Metadata`.

The reason that your example doesn't work as expected is
because of the `metadata: metadata` inside `serviceA` and `serviceB`:

{{{with code "en" "a1"}}}
-- in.cue --
#Config: {
	metadata: #Metadata

	serviceA: #BaseConfig & {
		metadata: metadata // this is the problem
	}

	serviceB: #BaseConfig & {
		metadata: metadata // and so is this
	}
}
{{{end}}}

Essentially, `metadata: metadata` is a reference to itself, and not to the
metadata field in the "outer" scope.\
**This is effectively the same as writing `metadata: _`** which is *almost*
always not what's intended.

We have thought about adding a linter that warns about this kind of self
reference but, because it's not *always* incorrect, it can't be flagged as an
evaluation error!

## Question #2

The user experimented some more, and asked again:

{{< quote >}}
I tried using <code>#Config.metadata</code>, but <code>problem2.cue</code>
still makes <code>cue</code> complain about incomplete values! Can you tell me
why?
{{< /quote >}}

{{{with code "en" "q2"}}}
! exec cue export problem2.cue --out yaml
cmp stderr out
-- problem2.cue --
#Metadata: {
	name:      string
	namespace: string
}

#BaseConfig: {
	metadata: #Metadata
}

#Config: {
	metadata: #Metadata

	serviceA: #BaseConfig & {
		metadata: #Config.metadata
	}

	serviceB: #BaseConfig & {
		metadata: #Config.metadata
	}
}

config: #Config & {
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
-- expected.yaml --
config:
  metadata:
    name: test
    namespace: dev
  serviceA:
    metadata:
      name: test
      namespace: dev
  serviceB:
    metadata:
      name: test
      namespace: dev
-- out --
config.serviceA.metadata.name: incomplete value string:
    ./problem2.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./problem2.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./problem2.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./problem2.cue:3:13
{{{end}}}

## Cuelang.org's answer #2

So, as before, this looks like a very reasonable attempt to solve the problem!

However, in `problem2.cue`, the reference to `#Config.metadata` is a reference
that's baked into the `#Config` struct **at the time it's declared**. It *will*
resolve to `#Metadata` and its contents, but only as they existed at the time
that `#Config` was declared.

Your actual *use* of `#Config`, unifying it with `config` and its `metadata`
struct that contains concrete values, happens separately. So `config.serviceA`
and `config.serviceB` each end up with a metadata field that refers to the
non-concrete values inside `#Metadata`. It's these non-concrete values that
can't be exported, and which cause `cue` to complain that they're incomplete.

## A solution

If both the previous attempts didn't manage to refer successfully to the
concrete `metadata` values provided as `config` is declared, how can we achieve
that?

The solution is: **use a CUE alias!**

{{{with code "en" "solution"}}}
exec cue export solution.cue --out yaml
cmp stdout out
-- solution.cue --
#Metadata: {
	name:      string
	namespace: string
}

#BaseConfig: {
	metadata: #Metadata
}

#Config: {
	M=metadata: #Metadata

	serviceA: #BaseConfig & {
		metadata: M
	}

	serviceB: #BaseConfig & {
		metadata: M
	}
}

config: #Config & {
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
-- expected.yaml --
config:
  metadata:
    name: test
    namespace: dev
  serviceA:
    metadata:
      name: test
      namespace: dev
  serviceB:
    metadata:
      name: test
      namespace: dev
-- out --
config:
  metadata:
    name: test
    namespace: dev
  serviceA:
    metadata:
      name: test
      namespace: dev
  serviceB:
    metadata:
      name: test
      namespace: dev
{{{end}}}

Declaring an alias means that **we're making a different name available for the
expression that it refers to**. In this case the expression is a reference to
the "outer" metadata field, now pointed to by the alias "`M`".

The alias is defined on the right hand side of `#Config`. It's "inside" `#Config`,
with the alias being part of the value on the right hand side. Thus, it's
present at the time that `#Config` is being *declared* and can be thought of as
a "relative" reference, within `#Config`'s value.

The critical point is that the alias being *relative*, within the right hand side
value, means that the reference is relative **wherever `#Config` is used**. So
when you create the regular `config` field, it unifies `#Config` with the
struct:

{{{with code "en" "metadata"}}}
-- in.cue --
{
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
{{{end}}}

The alias `M` then refers to the **unified** result of `metadata`, giving us
output that matches `expected.yaml`.
