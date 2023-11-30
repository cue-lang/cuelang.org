---
title: Alias and reference scopes
authors:
- myitcv
- jpluscplusm
tags:
- user question
toc_hide: true
---

## Problem #1

A user asked for help with a problem they were having with their CUE:

{{< quote >}}
Can you help me with <code>problem1.cue</code>? I'm trying to get YAML that
looks like <code>expected.yaml</code>, but instead I end up with these
"incomplete value" errors!
{{< /quote >}}

{{< code-tabs >}}
{{< code-tab name="problem1.cue" language="cue"  area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="expected.yaml" language="yaml"  area="top-right" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export problem1.cue --out yaml
config.serviceA.metadata.name: incomplete value string:
    ./problem1.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./problem1.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./problem1.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./problem1.cue:3:13
{{< /code-tab >}}
{{< /code-tabs >}}

## Explanation #1

Well, CUE user, your solution sure does look reasonable at first glance!

You're trying to make sure that wherever `#Config` is used, the fields
`serviceA.metadata` and `serviceB.metadata` are identical to the value of the
`metadata` field at the top level of whatever `#Config` is unified with, and
to ensure that these fields adhere to the constraints of `#Metadata`.

The reason that your example doesn't work as expected is because of the
`metadata: metadata` inside `serviceA` and `serviceB`:

```cue
#Config: {
	metadata: #Metadata

	serviceA: #BaseConfig & {
		// this is the problem
		metadata: metadata
	}

	serviceB: #BaseConfig & {
		// and so is this
		metadata: metadata
	}
}
```

Essentially, `metadata: metadata` is a reference to itself, and not to the
metadata field in the "outer" scope.

This is effectively the same as writing ` metadata: _ ` which is *almost*
always not what's intended. Top ("`_`") says nothing about a field: it doesn't
add any constraints and it doesn't provide a value - therefore this field is
incomplete.

We have thought about adding a linter that warns about this kind of self
reference but, because it's not invalid CUE, it can't be flagged as an
evaluation error!

## Problem #2

The user experimented some more, and asked again:

{{< quote >}}
I tried referring to <code>#Config.metadata</code>, but
<code>problem2.cue</code> still makes <code>cue</code> complain about
incomplete values! Can you tell me why?
{{< /quote >}}

{{< code-tabs >}}
{{< code-tab name="problem2.cue" language="cue"  area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="expected.yaml" language="yaml"  area="top-right" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export problem2.cue --out yaml
config.serviceA.metadata.name: incomplete value string:
    ./problem2.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./problem2.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./problem2.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./problem2.cue:3:13
{{< /code-tab >}}
{{< /code-tabs >}}

## Explanation #2

So, as before, this looks like a very reasonable attempt to solve the problem!

However, in `problem2.cue`, the reference to `#Config.metadata` is a reference
that's baked into the `#Config` struct at the time it's declared. It *will*
resolve to `#Metadata` and its contents, but only as they existed at the time
that `#Config` was declared.

Your actual *use* of `#Config` in the declaration of `config`, along with a
`metadata` struct that contains concrete values, happens separately. So
`config.serviceA` and `config.serviceB` each end up with a metadata field that
refers to the non-concrete values inside `#Metadata`. It's these non-concrete
values that can't be exported, and which cause `cue` to complain that they're
incomplete.

## Solution

Given both the problems encountered above, how can we *successfully* refer to
the concrete `metadata` values provided when `config` is declared?

The solution is: **use an alias!**

{{< code-tabs >}}
{{< code-tab name="solution.cue" language="cue"  area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="expected.yaml" language="yaml"  area="top-right" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export solution.cue --out yaml
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
{{< /code-tab >}}
{{< /code-tabs >}}

Declaring an alias means that we're **making a different name available** for
the expression that it refers to. In this case the expression is a reference to
the "outer" metadata field, now pointed to by the alias "`M`".

The alias is defined on the right hand side of `#Config`. It’s “inside” `#Config`,
with the alias being part of the value on the right hand side. It can be
thought of as a “relative” reference, within `#Config`’s value.

Critically, because the alias is *relative* within the right hand side value,
this means that the reference is relative **wherever `#Config` is used**. So
when you create the regular `config` field, it unifies `#Config` with this
struct:

```cue
{
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
```

The alias `M` then refers to the constraints of `#Config.metadata` and
`#Metadata`, and the concrete values of `config.metadata`, **all unified
together** - giving us output that successfully matches `expected.yaml`!
