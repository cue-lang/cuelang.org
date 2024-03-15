---
title: How CUE enables boilerplate removal
authors: [jpluscplusm]
toc_hide: true
---

Principles:

- we end up at `cue trim`, so the examples must lead towards that demo.
- cue-trim doesn't update non-CUE files, so the examples can't build on YAML/JSON/etc.

---

## Intro

TODO. Points:

- info density
- config files as views into a unified config space
  - config space is dense, and contains no duplication or redundant info
- easier for machines to process, but not for humans to understand or maintain

## Start

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


## Include schema constraints

Boilerplate removed: none.

This is a neccessary first step in understanding our config, so we can reduce it later.

We're just writing down the type-based information contained in our configs, and applying it via unification.

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

The addition of a schema has already delivered some benefit, and has caught the
type error in the `alpha` app.
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

## Template policy constraints and defaults

Now we template the schema's constraints into our `app` struct, removing the
need for each app to opt in. We add some policy constraints and defaults to our
`#App` definition, which get unified with the schema constraints and applied via templating.

Result: Boilterplate removed: anything set via a default.

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

## Template the last redundant data

There's one last piece of redundant data which we can remove using a template.

Result: boilerplate removed: the `name` field in each app.

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

Add the `gamma` app.

We only need to care about non-standard config.
Result: the `gamma` app is added without boilerplate or redundant information.

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

Reset back to our initial apps + `gamma`, along with our `schema.cue` and `policy.cue` files.

Motivate example: what if we had hundreds of apps, all with full specifications manually created over time?

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

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0=" }
$ cue trim
````

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


## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about {{< linkto/inline "concept/how-cue-enables-configuration" >}}
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}}
