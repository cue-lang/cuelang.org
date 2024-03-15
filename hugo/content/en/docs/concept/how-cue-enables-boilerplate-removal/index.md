---
title: How CUE enables boilerplate removal
authors: [jpluscplusm]
toc_hide: true
---

<!--
Principles:

- we end up at `cue trim`, so the examples must lead towards that demo.
- cue-trim doesn't update non-CUE files, so the examples can't build on YAML/JSON/etc.
-->

Boilerplate code is noise that often obscures the unique, important details
that need to stand out. Even worse, code that includes boilerplate increases
our maintenance burden. Duplicated information has to be copied into
place, and derived information has to be re-calculated carefully.

You might already be using CUE to reduce configuration boilerplate through some
of its basic features, such as references and string interpolation. These allow
information to be specified just once -- reducing the toil involved when
updating the single source of truth:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
package example

app: {
	name:  "foo"
	id:    name + "-app"
	root:  "https://\(name).example.com"
	login: root + "/login/"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  name: foo
  id: foo-app
  root: https://foo.example.com
  login: https://foo.example.com/login/
{{< /code-tab >}}
{{< /code-tabs >}}

The CUE language provides several more features which help eliminate our
boilerplate code, reduce our maintenance burden, and prevent mistakes when
manually updating our configurations.

This guide shows the features in action: simplifying a configuration so it's
easier for humans to take in at a glance by increasing the density of its
information, while leaving it unchanged for the machines and systems that
rely on boilerplate. Make sure to read through to the end, where we'll see a
powerful command which *automatically* removes the boilerplate for us!

## V0: starting point

{{< TODO " " >}}

- explain context
- lightly explain the example form we'll be using throughout?

There is a good deal of boilerplate in them.
We will use different CUE features to show how they can be slimmed down and made more maintainable.

{{< code-tabs >}}
{{< code-tab name="alpha.cue" language="cue" area="top" >}}
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: "8080"
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}
{{< /code-tabs >}}


## V1: Include schema constraints

{{< TODO " " >}}

- Boilerplate removed: none.
- This is a necessary first step in understanding our config, so we can reduce it later.
- We're just writing down the type-based information contained in our configs, and applying it via unification.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}
{{< code-tab name="alpha.cue" language="cue" area="top-right" >}}
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top-right" >}}
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
    ./alpha.cue:6:12
    ./schema.cue:6:13
{{< /code-tab >}}
{{< /code-tabs >}}

The addition of a schema has already caught a type error in the `alpha` app's config.
We correct the problem in our data, and re-export:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}
{{< code-tab name="alpha.cue" language="cue" area="top-right" >}}
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top-right" >}}
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}
{{< /code-tabs >}}

## V2: Template policy constraints and defaults

{{< TODO " " >}}

- Point out which fields have reasonable default values:
  - port: 8080
  - memory: 512
  - security: why we don't default to low or medium

We can remove them using CUE's default values.

> Now we template the schema's constraints into our `app` struct, removing the
need for each app to opt in via unification. We add some policy constraints and
defaults to our `#App` definition, which get unified with the schema
constraints and applied via templating.

- Result: Boilerplate removed: **anything set via a default**.

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package config

app: [_]: #App
#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}
{{< code-tab name="alpha.cue" language="cue" area="top-right" >}}
package config

app: alpha: {
	name:     "alpha"
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top-right" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}
{{< /code-tabs >}}

Same output maintained.

## V3: Template the remaining redundant data

{{< TODO " " >}}

- There's one last piece of redundant data: the `name` field and each app's path in the `app` struct.
- we remove it using a template
- we set it as a default value that allows overriding if a future app needs to
- Result: boilerplate removed: the `name` field in each app.

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package config

app: [Name=_]: #App & {
	name: *"\(Name)" | _
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}
{{< code-tab name="alpha.cue" language="cue" area="top-right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top-right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}
{{< /code-tabs >}}

## Adding a new app is trivial

{{< TODO " " >}}

- Add the `gamma` app.
- We only need to care about non-standard config.
- Result: the `gamma` app is added without boilerplate or redundant information.

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}
{{< code-tab name="gamma.cue" language="cue" area="top-right" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}
{{< code-tab name="alpha.cue" language="cue" area="top-right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}
{{< code-tab name="beta.cue" language="cue" area="top-right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
  gamma:
    name: gamma
    memory: 512
    port: 80
    security: high
{{< /code-tab >}}
{{< /code-tabs >}}

## `cue trim`

{{< TODO " " >}}

- Reset back to our initial 2 apps + `gamma`, along with our `schema.cue` and `policy.cue` files.
- Motivate example: what if we had hundreds of apps, all with full specifications manually created over time?

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-right" >}}
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}{{< code-tab name="schema.cue" language="cue" area="top-right" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="top-left" >}}
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="top-left" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< code-tab name="gamma.cue" language="cue" area="top-left" >}}
package config

app: gamma: {
	name:     "gamma"
	memory:   512
	port:     80
	security: "high"
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< TODO " " >}}

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0=" }
$ cue trim
````

{{< TODO "Point out info density increase due to removed boilerplate" >}}

{{< code-tabs >}}
{{< code-tab name="alpha.cue" language="cue" area="top-left" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="top-left" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< code-tab name="gamma.cue" language="cue" area="top-left" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< TODO " " >}}

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
app:
  alpha:
    name: alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: beta
    memory: 1024
    port: 8080
    security: medium
  gamma:
    name: gamma
    memory: 512
    port: 80
    security: high
````

{{< TODO " " >}}

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about {{< linkto/inline "concept/how-cue-enables-configuration" >}}
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
  - TODO: link to defaults
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}}
