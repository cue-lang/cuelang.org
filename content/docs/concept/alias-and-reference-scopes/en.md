---
title: Alias and reference scopes
authors:
- myitcv
tags:
- user question
toc_hide: true
---

## User question

A CUE user writes:

{{< columns >}}

"**Can you help me with this example?**":

{{{with code "en" "input1"}}}
-- file.cue --
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
{{{end}}}

{{< columns-separator >}}

"**I'm expecting to get YAML like this**":

{{{with code "en" "expected1"}}}
-- file.yaml --
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

{{< /columns >}}

"**But instead, I get this error**":

{{{with code "en" "actual1"}}}
-- text --
config.serviceA.metadata.name: incomplete value string:
    -:2:11
config.serviceA.metadata.namespace: incomplete value string:
    -:3:16
config.serviceB.metadata.name: incomplete value string:
    -:2:11
config.serviceB.metadata.namespace: incomplete value string:
    -:3:16
{{{end}}}

{{< columns >}}

"**I tried using `#Config.metadata`, like this**":

{{{with code "en" "input2"}}}
-- file.cue --
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
{{{end}}}

{{< columns-separator >}}

"**... but there were still "incomplete value" complaints**":

{{{with code "en" "actual2"}}}
-- text --
config.serviceA.metadata.name:
  incomplete value string:
    -:2:11
config.serviceA.metadata.namespace:
  incomplete value string:
    -:3:16
config.serviceB.metadata.name:
  incomplete value string:
    -:2:11
config.serviceB.metadata.namespace:
  incomplete value string:
    -:3:16
{{{end}}}

{{< /columns >}}

"**However *this* form, using an alias, succeeds**":

{{{with code "en" "success"}}}
-- in.cue --
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
-- out.yaml --
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

{{< quote >}}
Is CUE evaluating the alias differently?
{{< /quote >}}

<hr>

## Cuelang.org's answer

Well, CUE user, the reason that your *first* example doesn't work as expected
is because of the `metadata: metadata` on lines 14 and 18:
<!-- FIXME: do the line numbers appear on netlify? -->

{{{with code "en" "answer1"}}}
#codetab(file.cue) linenos="table"

! exec cue export file.cue
cmp stderr ERROR
-- file.cue --
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
-- ERROR --
config.serviceA.metadata.name: incomplete value string:
    ./file.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./file.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./file.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./file.cue:3:13
{{{end}}}

This is essentially a reference to self, and not to the metadata field in the
"outer" scope.\
**It's effectively the same as writing `metadata: _`.**

(We *have* thought about adding a linter that warns about this kind of self
reference, as it's *almost* always **not** what the user intended. But because
it's not *always* wrong it can't be flagged as an evaluation error!)

So: if the previous example didn't manage to refer to the "outer" metadata
field, how can we achieve that?\
That's where the alias-based solution you reached is needed:

{{{with code "en" "answer2"}}}
-- file.cue --
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
{{{end}}}

Assigning an alias means that **we're making a different name available for the
expression it refers to**.

In this case the expression is a reference to the "outer" metadata field,
pointed to by the alias "`M`".\
By assigning and using this alias, the value of the "outer" metadata field is
templated as expected, and this solution works.

But why does your second example, using `#Config.metadata`, result in
complaints about incomplete values on export? As a reminder, here's the example
again - both the CUE and its resulting error message:

{{{with code "en" "answer3"}}}
-- in.cue --
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
-- out.err --
config.serviceA.metadata.name: incomplete value string:
    ./in.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./in.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./in.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./in.cue:3:13
{{{end}}}

To understand this, take a look back at the solution that works - the example
that uses an alias.

The alias is defined on the right hand side of `#Config` - "inside" `#Config`,
with the alias being part of the value on the right hand side. Thus, it's
present at the time that `#Config` is being *declared* and can be thought of as
a "relative" reference, within `#Config`'s value.

By constrast, in the failing example immediately above, the reference to
`#Config.metadata` can be thought of as an absolute reference to the field
`#Config.metadata` (which will resolve to `#Metadata` and its contents). The
critical point is that the alias being *relative*, within the right hand side
value, means that **the reference is relative wherever `#Config` is used**. So
when you create the regular `config` field, it unifies `#Config` with the
struct:

{{{with code "en" "answer4"}}}
-- in.cue --
{
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
{{{end}}}

The alias `M` then refers to the **unified** result of `metadata`, giving us
the "right" answer ... compared to the absolute reference to
`#Config.metadata`, that doesn't.
