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

```cue
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
```

{{< columns-separator >}}

"**I'm expecting to get YAML like this**":

```yaml
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
```

{{< /columns >}}

"**But instead, I get this error**":

```
config.serviceA.metadata.name: incomplete value string:
    -:2:11
config.serviceA.metadata.namespace: incomplete value string:
    -:3:16
config.serviceB.metadata.name: incomplete value string:
    -:2:11
config.serviceB.metadata.namespace: incomplete value string:
    -:3:16
```

{{< columns >}}

"**I tried using `#Config.metadata`, like this**":

```cue
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
```

{{< columns-separator >}}

"**... but there were still "incomplete value" complaints**":

```
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
```

{{< /columns >}}

"**However *this* form, using an alias, succeeds**":

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
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
{{< code-tab name="YAML" language="yaml" type="terminal" area="top-right" >}}
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

{{< quote >}}
Is CUE evaluating the alias differently?
{{< /quote >}}

<hr>

## Cuelang.org's answer

Well, CUE user, the reason that your *first* example doesn't work as expected
is because of the `metadata: metadata` inside `serviceA` and `serviceB`.
<!-- FIXME: can we get line numbers to appear in .cue files, inside code blocks? -->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
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
{{< code-tab name="ERROR" language=""  area="top-right" >}}
config.serviceA.metadata.name: incomplete value string:
    ./file.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./file.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./file.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./file.cue:3:13
{{< /code-tab >}}
{{< /code-tabs >}}

This is essentially a reference to self, and not to the metadata field in the
"outer" scope.\
**It's effectively the same as writing `metadata: _`.**

(We *have* thought about adding a linter that warns about this kind of self
reference, as it's *almost* always **not** what the user intended. But because
it's not *always* wrong it can't be flagged as an evaluation error!)

So: if the previous example didn't manage to refer to the "outer" metadata
field, how can we achieve that?\
That's where the alias-based solution you reached is needed:

```cue
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
```

Assigning an alias means that **we're making a different name available for the
expression it refers to**.

In this case the expression is a reference to the "outer" metadata field,
pointed to by the alias "`M`".\
By assigning and using this alias, the value of the "outer" metadata field is
templated as expected, and this solution works.

But why does your second example, using `#Config.metadata`, result in
complaints about incomplete values on export? As a reminder, here's the example
again - both the CUE and its resulting error message:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
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
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
config.serviceA.metadata.name: incomplete value string:
    ./in.cue:2:13
config.serviceA.metadata.namespace: incomplete value string:
    ./in.cue:3:13
config.serviceB.metadata.name: incomplete value string:
    ./in.cue:2:13
config.serviceB.metadata.namespace: incomplete value string:
    ./in.cue:3:13
{{< /code-tab >}}
{{< /code-tabs >}}

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

```cue
{
	metadata: {
		name:      "test"
		namespace: "dev"
	}
}
```

The alias `M` then refers to the **unified** result of `metadata`, giving us
the "right" answer ... compared to the absolute reference to
`#Config.metadata`, that doesn't.
