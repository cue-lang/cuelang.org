---
title: How CUE enables boilerplate removal
authors: [jpluscplusm]
toc_hide: true
---

Configuration boilerplate is noise --
**CUE lets you turn down the noise by reducing the boilerplate**.

In this guide we'll run through some of CUE's features that help you reduce and
remove boilerplate, letting you focus on the important, unique details that
were previously lost in the weeds. We'll finish by showing you a feature
that **automatically removes boilerplate**.
Here's what you'll find in this guide:

{{<columns>}}
- [Our starting point](#our-starting-point)
- ["Order-irrelevance" lets you remove boilerplate](#order-irrelevance-lets-you-remove-boilerplate)
- ["Default values" let you remove boilerplate](#default-values-let-you-remove-boilerplate)
{{<columns-separator>}}
- ["Templates" let you remove boilerplate](#templates-let-you-remove-boilerplate)
- [`cue trim` removes boilerplate automatically!](#cue-trim-removes-boilerplate-automatically)
- [Next steps](#next-steps)
{{</columns>}}

---

## Our starting point

We're going to start with three files, `app-1.cue`, `app-2.cue`, and
`app-3.cue`, and progressively slim them down by using each CUE feature in
turn:

{{< columns >}}
{{{with upload "en" "app-1.cue"}}}
-- app-1.cue --
package config

app: foo: {
	name:     "foo"
	port:     7777
	id:       "foo.example"
	security: "LOW"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "app-2.cue"}}}
-- app-2.cue --
package config

app: bar: {
	name:     "bar"
	port:     5555
	id:       "bar.example"
	security: "HIGH"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "app-3.cue"}}}
-- app-3.cue --
package config

app: baz: {
	name:     "baz"
	port:     7777
	id:       "baz.example"
	security: "MEDIUM"
}
{{{end}}}
{{< /columns >}}

## "Order-irrelevance" lets you remove boilerplate

CUE is defined so that
[order is irrelevant]({{< relref "docs/tour/basics/order-irrelevance" >}}).
Because of this, when a configuration is unified from all its disparate
sources, important facts only need to be specified once.

In this example, we've modified each `app` so that it unifies with the
centrally-defined `App`, picking up all the fields specified at the policy
level without needing them to be stated at the per-`app` level. Both static and
dynamic field values are unified and injected into the `deployments` output
struct:

{{{with code "en" "order-irrelevance"}}}
#location top-left top-left top-left top-right bottom

exec cue export -e output --out yaml
cmp stdout out
-- app-1.cue --
package config

app: foo: App & {
	name:     "foo"
	port:     7777
	security: "LOW"
}
-- app-2.cue --
package config

app: bar: App & {
	name:     "bar"
	port:     5555
	security: "HIGH"
}
-- app-3.cue --
package config

app: baz: App & {
	name:     "baz"
	port:     7777
	security: "MEDIUM"
}
-- policy.cue --
package config

app: _
output: deployments: app
App: {
	name!:     string
	port!:     int
	id:        name + ".example"
	security!: "HIGH" | "MEDIUM" | "LOW"
}
-- out --
deployments:
  bar:
    name: bar
    port: 5555
    id: bar.example
    security: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    security: MEDIUM
  foo:
    name: foo
    port: 7777
    id: foo.example
    security: LOW
{{{end}}}

Find out more in the {{< linkto/related/tour "basics/unification" >}}.

## "Default values" let you remove boilerplate

CUE disallows overrides. Overrides often lead to wasted time, chasing down a
tanged web of overlapping, nested layers, with the design of such systems
stemming from the fact that overrides are flawed, but are the *best or most
familiar mechanism* the designer had available.

**CUE is different**. CUE allows a field to have a *single* level of default
value specified, which is used *if and only if* it's not specified elsewhere.
Multiple defaults don't "stack", so any concrete data specified takes
precedence over the default. The careful use of defaults can remove
boilerplate configuration, letting us see where concrete values originated.

Here, we further reduce boilerplate in our example by specifying a default
`port` and `security`, while still allowing them to be varied as needed:

{{{with code "en" "defaults"}}}
#location top-left top-left top-left top-right bottom

exec cue export -e output --out yaml
cmp stdout out
-- app-1.cue --
package config

app: foo: App & {
	name:     "foo"
	security: "LOW"
}
-- app-2.cue --
package config

app: bar: App & {
	name: "bar"
	port: 5555
}
-- app-3.cue --
package config

app: baz: App & {
	name:     "baz"
	security: "MEDIUM"
}
-- policy.cue --
package config

app: _
output: deployments: app
App: {
	name!:    string
	port:     *7777 | int
	id:       name + ".example"
	security: *"HIGH" | "MEDIUM" | "LOW"
}
-- out --
deployments:
  bar:
    name: bar
    port: 5555
    id: bar.example
    security: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    security: MEDIUM
  foo:
    name: foo
    port: 7777
    id: foo.example
    security: LOW
{{{end}}}

Find out more in this {{< linkto/related/howto "specify-a-default-value-for-a-field" >}}.

## "Templates" let you remove boilerplate

There's still some boilerplate in our example: each app's `name` field directly
matches the path under which the app lives.
CUE's **templates allow us remove this final boilerplate**, and to reduce each
`app` instance down to just the single field that makes it stand out from the
data defined in `policy.cue`:

{{{with code "en" "templates"}}}
#location top-left top-left top-left top-right bottom

exec cue export -e output --out yaml
cmp stdout out
-- app-1.cue --
package config

app: foo: {
	security: "LOW"
}
-- app-2.cue --
package config

app: bar: {
	port: 5555
}
-- app-3.cue --
package config

app: baz: {
	security: "MEDIUM"
}
-- policy.cue --
package config

output: deployments: app

// This template is unified with each member of
// the app struct.
app: [Name=string]: {
	name:     Name
	port:     *7777 | int
	id:       name + ".example"
	security: *"HIGH" | "MEDIUM" | "LOW"
}
-- out --
deployments:
  bar:
    name: bar
    port: 5555
    id: bar.example
    security: HIGH
  baz:
    name: baz
    port: 7777
    id: baz.example
    security: MEDIUM
  foo:
    name: foo
    port: 7777
    id: foo.example
    security: LOW
{{{end}}}

Find out more in the {{< linkto/related/tour "types/templates" >}}.

## `cue trim` removes boilerplate automatically!

We just did a bunch of work, updating our three `app` files. Imagine how fiddly
the process would be if we had to work with tens, hundreds, or thousands of
`app-N.cue` files. Well, here's some good news: **CUE can do this work for us!**

We'll start by reverting our three `app-N.cue` files back to their original
forms, placing them alongside the `policy.cue` file we derived above:

{{{with upload "en" "revert app-X.cue"}}}
#force
#location left left left right
-- app-1.cue --
package config

app: foo: {
	name:     "foo"
	port:     7777
	id:       "foo.example"
	security: "LOW"
}
-- app-2.cue --
package config

app: bar: {
	name:     "bar"
	port:     5555
	id:       "bar.example"
	security: "HIGH"
}
-- app-3.cue --
package config

app: baz: {
	name:     "baz"
	port:     7777
	id:       "baz.example"
	security: "MEDIUM"
}
-- policy.cue --
package config

output: deployments: app
app: [Name=string]: {
	name:     Name
	port:     *7777 | int
	id:       name + ".example"
	security: *"HIGH" | "MEDIUM" | "LOW"
}
{{{end}}}

We invoke `cue trim` to remove all the boilerplate it can find:

{{{with script "en" "cue trim"}}}
cue trim
{{{end}}}

Notice that the command remains silent to indicate that it completed successfully.

We check our three `app-N.cue` files and find that the `cue trim` command has
updated them for us:

{{{with upload "en" "check app-X.cue"}}}
#location left right left
#assert
-- app-1.cue --
package config

app: foo: {
	security: "LOW"
}
-- app-2.cue --
package config

app: bar: {
	port: 5555
}
-- app-3.cue --
package config

app: baz: {
	security: "MEDIUM"
}
{{{end}}}

Lastly, we verify that exporting the new files gives the result we expect:

{{{with script "en" "check export"}}}
cue export -e output --out yaml
{{{end}}}

**`cue trim` has identified the same boilerplate that we removed by hand, and
ended up with the same result!**

Of course, *here* we started with the benefit of having already developed the
boilerplate-replacing `policy.cue`.
One powerful way to use `cue trim` to develop the `policy.cue` equivalent from
scratch is to have the baseline configuration files checked in to version
control; to start with a clean working directory; and to build up the CUE
*incrementally*.
Running `cue trim` each time we make a change to the boilerplate-replacing CUE
allows us to use `git diff` (or similar) to see the *effect* of the most recent
change, and to use the new information to reduce the boilerplate -- piece by
piece.

Find out more about `cue trim` in {{< linkto/related/reference "command/cue-help-trim" >}}.

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about
  [how CUE enables configuration]({{< relref "how-cue-enables-configuration" >}})
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}}
