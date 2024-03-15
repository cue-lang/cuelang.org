---
title: How CUE enables boilerplate removal
tags:
authors:
- jpluscplusm
toc_hide: true
---

Boilerplate is noise. **CUE lets you reduce the boilerplate**, cut through the
noise, and focus on the important, unique details that lie at that heart of the
different systems you're configuring.

In this guide we'll run through some of CUE's features that help you reduce and
remove boilerplate, and finish by showing off a feature that **automatically
removes boilerplate for you**.

We're going to start with three files, `app-1.cue`, `app-2.cue`, and
`app-3.cue`, and progressively slim them down by using each CUE feature in
turn:

{{< columns >}}
```cue { title="app-1.cue" }
package config

app: foo: {
	name:          "foo"
	port:          8080
	id:            "foo.app.example"
	securityLevel: "HIGH"
}
```
{{< columns-separator >}}
```cue { title="app-2.cue" }
package config

app: bar: {
	name:          "bar"
	port:          9999
	id:            "bar.app.example"
	securityLevel: "HIGH"
}
```
{{< columns-separator >}}
```cue { title="app-3.cue" }
package config

app: baz: {
	name:          "baz"
	port:          8080
	id:            "baz.app.example"
	securityLevel: "HIGH"
}
```
{{< /columns >}}

**On this page**: FIXME
\## Order-irrelevance lets you remove boilerplate
\## Defaults let you remove boilerplate
\## Templates let you remove boilerplate
\## `cue trim` removes boilerplate automatically!
\## Getting started

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
	port: 8080
}
{{< /code-tab >}}
{{< code-tab name="app-2.cue" language="cue" area="top-left" >}}
package config

app: bar: App & {
	name: "bar"
	port: 9999
}
{{< /code-tab >}}
{{< code-tab name="app-3.cue" language="cue" area="top-left" >}}
package config

app: baz: App & {
	name: "baz"
	port: 8080
}
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

App: {
	name!:         string // name is required.
	port!:         int
	id:            name + ".app.example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSAne2RlcGxveW1lbnRzOiBhcHB9JyAtLW91dCB5YW1s" >}}
$ cue export -e '{deployments: app}' --out yaml
deployments:
  foo:
    name: foo
    port: 8080
    id: foo.app.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 9999
    id: bar.app.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 8080
    id: baz.app.example
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
boilerplate configuration, whilst still being able to tell where the value
originated.

Here, we further reduce boilerplate in our example by specifying a default
`port`, whilst still allowing it be be provided, as required by `app-2.cue`:

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
	port: 9999
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

App: {
	name!:         string // name is required.
	port:          *8080 | int
	id:            name + ".app.example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSAne2RlcGxveW1lbnRzOiBhcHB9JyAtLW91dCB5YW1s" >}}
$ cue export -e '{deployments: app}' --out yaml
deployments:
  foo:
    name: foo
    port: 8080
    id: foo.app.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 9999
    id: bar.app.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 8080
    id: baz.app.example
    securityLevel: HIGH
{{< /code-tab >}}
{{< /code-tabs >}}

Read more: [Language Tour: Defaults]({{< relref "docs/tour/types/defaults" >}})

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

app: bar: port: 9999
{{< /code-tab >}}
{{< code-tab name="app-3.cue" language="cue" area="top-left" >}}
package config

app: baz: _
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

output: deployments: app
app: [Name=string]: {
	name:          Name
	port:          *8080 | int
	id:            name + ".app.example"
	securityLevel: "HIGH"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQgLS1vdXQgeWFtbA==" >}}
$ cue export -e output --out yaml
deployments:
  foo:
    name: foo
    port: 8080
    id: foo.app.example
    securityLevel: HIGH
  bar:
    name: bar
    port: 9999
    id: bar.app.example
    securityLevel: HIGH
  baz:
    name: baz
    port: 8080
    id: baz.app.example
    securityLevel: HIGH
{{< /code-tab >}}
{{< /code-tabs >}}

Read more: [Language Tour: Templates]({{< relref "docs/tour/types/templates" >}})

## `cue trim` removes boilerplate automatically!

We just did a bunch of work, updating our three `app` files. Imagine how fiddly
the process would be if we had to work with tens or hundreds of `app-X.cue`
files!

The good news is that **`cue trim` can do this work for us**.

Here, we'll take our three initial `app-X.cue` files and our new `policy.cue`
file, and tell `cue trim` to take a look:
```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0KY2F0IGFwcC0xLmN1ZQpjYXQgYXBwLTIuY3VlCmNhdCBhcHAtMy5jdWUK" }
$ cue trim
$ cat app-1.cue
package config

app: foo: {
}
$ cat app-2.cue
package config

app: bar: {
	port: 9999
}
$ cat app-3.cue
package config

app: baz: {
}
```

## Getting started

For your next steps with CUE, why not:

- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about [the technologies that CUE directly integrates with]({{< relref
  "docs/integration" >}})
<!-- TODO: extend list when more docs have landed -->
