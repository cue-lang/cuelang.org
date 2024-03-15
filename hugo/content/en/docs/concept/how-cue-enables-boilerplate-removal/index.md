---
title: How CUE enables boilerplate removal
tags:
authors:
- jpluscplusm
toc_hide: true
---

Boilerplate is noise, and **CUE lets you reduce the boilerplate** - cutting
through the noise and helping you concentrate on the important, unique details
that were previously obscured.

In this guide we'll run through some of CUE's features that help you reduce and
remove boilerplate, and finish by showing you a feature that **automatically
removes boilerplate**.

- [Order-irrelevance lets you remove boilerplate](#order-irrelevance-lets-you-remove-boilerplate)
- [Defaults let you remove boilerplate](#defaults-let-you-remove-boilerplate)\
- [Templates let you remove boilerplate](#templates-let-you-remove-boilerplate)
- [`cue trim` removes boilerplate automatically!](#cue-trim-removes-boilerplate-automatically)
- [Next steps](#next-steps)

We're going to start with three files, `app-1.cue`, `app-2.cue`, and
`app-3.cue`, and progressively slim them down by using each CUE feature in
turn:

{{< columns >}}
```cue { title="app-1.cue" }
package config

app: foo: {
	name:          "foo"
	port:          7777
	id:            "foo.example"
	securityLevel: "HIGH"
}
```
{{< columns-separator >}}
```cue { title="app-2.cue" }
package config

app: bar: {
	name:          "bar"
	port:          5555
	id:            "bar.example"
	securityLevel: "HIGH"
}
```
{{< columns-separator >}}
```cue { title="app-3.cue" }
package config

app: baz: {
	name:          "baz"
	port:          7777
	id:            "baz.example"
	securityLevel: "HIGH"
}
```
{{< /columns >}}

## Order-irrelevance lets you remove boilerplate

CUE is defined so that [order is irrelevant]({{< relref
"docs/tour/basics/order-irrelevance" >}}).
Because of this, when a configuration is unified from all its disparate
sources, important facts only need to be specified once, *and they can't be
unspecified*.

In this example, we've modified each `app` so that it unifies with the
centrally-defined `App`, picking up all the fields specified at the policy
level without needing them to be stated at the per-`app` level. Both static and
dynamic field values are unified and injected into the `deployments` output
struct:

{{< code-tabs >}}
{{< code-tab name="app-1.cue" language="cue" area="top-left" >}}
package config

app: foo: App & {
	name: "foo"
	port: 7777
}
{{< /code-tab >}}
{{< code-tab name="app-2.cue" language="cue" area="top-left" >}}
package config

app: bar: App & {
	name: "bar"
	port: 5555
}
{{< /code-tab >}}
{{< code-tab name="app-3.cue" language="cue" area="top-left" >}}
package config

app: baz: App & {
	name: "baz"
	port: 7777
}
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

app: _
output: deployments: app
App: {
	name!:         string // name is required.
	port!:         int
	id:            name + ".example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQgLS1vdXQgeWFtbA==" >}}
$ cue export -e output --out yaml
deployments:
  foo:
    name: foo
    port: 7777
    id: foo.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 5555
    id: bar.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    securityLevel: HIGH
{{< /code-tab >}}
{{< /code-tabs >}}

Read more: [Language Tour: Duplicate Fields]({{< relref "docs/tour/basics/duplicate-fields" >}})

## Defaults let you remove boilerplate

CUE disallows overrides. Overrides often lead to wasted time, chasing down a
tanged web of overlapping, nested layers, with the design of such systems
stemming from the fact that overrides are flawed, but are the *best or most
familiar mechanism* the designer had available.

**CUE is different**. CUE allows a field to have a **single level of default
value specified**, which is used if *and only if* it's not specified elsewhere.
Multiple **defaults don't "stack"**, so **any concrete data specified takes
precedence** over the default. The careful use of defaults can remove
boilerplate configuration, letting us see where concrete values originated.

Here, we further reduce boilerplate in our example by specifying a default
`port` whilst still allowing it to be provided, as required by `app-2.cue`:

{{< code-tabs >}}
{{< code-tab name="app-1.cue" language="cue" area="top-left" >}}
package config

app: foo: App & {
	name: "foo"
}
{{< /code-tab >}}
{{< code-tab name="app-2.cue" language="cue" area="top-left" >}}
package config

app: bar: App & {
	name: "bar"
	port: 5555
}
{{< /code-tab >}}
{{< code-tab name="app-3.cue" language="cue" area="top-left" >}}
package config

app: baz: App & {
	name: "baz"
}
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

app: _
output: deployments: app
App: {
	name!:         string // name is required.
	port:          *7777 | int
	id:            name + ".example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQgLS1vdXQgeWFtbA==" >}}
$ cue export -e output --out yaml
deployments:
  foo:
    name: foo
    port: 7777
    id: foo.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 5555
    id: bar.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    securityLevel: HIGH
{{< /code-tab >}}
{{< /code-tabs >}}

Read more: [How-to Guide: Specifying a default value for a field]({{< relref "docs/howto/specify-a-default-value-for-a-field" >}})

## Templates let you remove boilerplate

There's still some boilerplate in our example: each app's `name` field directly
matches the path under which the app lives.
CUE's **templates allow us remove this final boilerplate**, and shrink the
default `app` instances down to just the single `_` field that establishes
their presence in the structured data.

`app-2.cue` still needs to specify a non-standard `port`, but it uses CUE's
[single-field nested struct form]({{< relref "docs/tour/basics/folding-structs" >}})
to achieve this in a single line.

{{< code-tabs >}}
{{< code-tab name="app-1.cue" language="cue" area="top-left" >}}
package config

app: foo: _
{{< /code-tab >}}
{{< code-tab name="app-2.cue" language="cue" area="top-left" >}}
package config

app: bar: port: 5555
{{< /code-tab >}}
{{< code-tab name="app-3.cue" language="cue" area="top-left" >}}
package config

app: baz: _
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

output: deployments: app

// This template is unified with each member of
// the app struct.
app: [Name=string]: {
	name:          Name
	port:          *7777 | int
	id:            name + ".example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQgLS1vdXQgeWFtbA==" >}}
$ cue export -e output --out yaml
deployments:
  foo:
    name: foo
    port: 7777
    id: foo.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 5555
    id: bar.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    securityLevel: HIGH
{{< /code-tab >}}
{{< /code-tabs >}}

Read more: [Language Tour: Templates]({{< relref "docs/tour/types/templates" >}})

## `cue trim` removes boilerplate automatically!

We just did a bunch of work, updating our three `app` files. Imagine how fiddly
the process would be if we had to work with tens, hundreds, or thousands of
`app-X.cue` files!

The good news is that **`cue trim` can do this work for us**.

Here, we'll revert to our three original `app-X.cue` files, add our new
`policy.cue` file, and tell `cue trim` to remove all the boilerplate it can.
We'll finish by re-exporting the configuration to check it's still what we
expect:
```text { title="TERMINAL" codeToCopy="dGFpbCAtbjk5IGFwcC0qLmN1ZQpjdWUgdHJpbQp0YWlsIC1uOTkgYXBwLSouY3VlCmN1ZSBleHBvcnQgLWUgb3V0cHV0IC0tb3V0IHlhbWw=" }
# The original app-*.cue files:
$ tail -n99 app-*.cue
==> app-1.cue <==
package config

app: foo: {
	name:          "foo"
	port:          7777
	id:            "foo.example"
	securityLevel: "HIGH"
}


==> app-2.cue <==
package config

app: bar: {
	name:          "bar"
	port:          5555
	id:            "bar.example"
	securityLevel: "HIGH"
}


==> app-3.cue <==
package config

app: baz: {
	name:          "baz"
	port:          7777
	id:            "baz.example"
	securityLevel: "HIGH"
}

# # # # # # # CUE TRIM # # # # # # # #
$ cue trim

# The modified app-*.cue files:
$ tail -n99 app-*.cue
==> app-1.cue <==
package config

app: foo: {
}

==> app-2.cue <==
package config

app: bar: {
	port: 5555
}

==> app-3.cue <==
package config

app: baz: {
}

# Verify that exporting the new files gives the right result:
$ cue export -e output --out yaml
deployments:
  foo:
    name: foo
    port: 7777
    id: foo.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 5555
    id: bar.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    securityLevel: HIGH
```

`cue trim` has identified the same boilerplate that we removed by hand, and
ended up with the same result!

Of course, *here* we started with the benefit of having already developed the
boilerplate-replacing `policy.cue`. One powerful way to use `cue trim` to develop
that CUE from scratch is to have config files checked in to version
control, to start with clean working directory, and to incrementally build up
the CUE. Running `cue trim` each time we make a change to the
boilerplate-replacing CUE allows us to use `git diff` (or similar) to see the
*effect* of the most recent change, and to use the new information to reduce
the boilerplate, piece by piece.

Read more about `cue trim` in its
[reference documentation]({{< relref "docs/reference/cli/cue-trim" >}})

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Read about
  [how CUE enables configuration]({{< relref "how-cue-enables-configuration" >}})
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Learn more in the `cue trim`
  [reference documentation]({{< relref "docs/reference/cli/cue-trim" >}})
<!-- TODO: extend list when more docs have landed -->
