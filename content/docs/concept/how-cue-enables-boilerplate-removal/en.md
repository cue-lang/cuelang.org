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

{{{with code "en" "1"}}}
#location top top bottom
exec cue export --out yaml
cmp stdout out
-- alpha.cue --
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
-- out --
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
{{{end}}}


## Include schema constraints

Boilerplate removed: none.

This is a neccessary first step in understanding our config, so we can reduce it later.

We're just writing down the type-based information contained in our configs, and applying it via unification.

{{{with code "en" "2"}}}
#location top-left top-right top-right bottom
! exec cue export --out yaml
cmp stderr out
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- alpha.cue --
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
-- beta.cue --
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
-- out --
app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
    ./alpha.cue:6:12
    ./schema.cue:6:13
{{{end}}}

The addition of a schema has already delivered some benefit, and has caught the
type error in the `alpha` app.
We correct the problem in our data, and re-export:

{{{with code "en" "3"}}}
#location top-left top-right top-right bottom
exec cue export --out yaml
cmp stdout out
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- alpha.cue --
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
-- beta.cue --
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
-- out --
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
{{{end}}}

## Template policy constraints and defaults

Now we template the schema's constraints into our `app` struct, removing the
need for each app to opt in. We add some policy constraints and defaults to our
`#App` definition, which get unified with the schema constraints and applied via templating.

Result: Boilterplate removed: anything set via a default.

{{{with code "en" "4"}}}
#location top-left top-left top-right top-right bottom
exec cue export --out yaml
cmp stdout out
-- policy.cue --
package config

app: [_]: #App
#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- alpha.cue --
package config

app: alpha: {
	name:     "alpha"
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	name:     "beta"
	memory:   1024
	security: "medium"
}
-- out --
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
{{{end}}}

Same output maintained.

## Template the last redundant data

There's one last piece of redundant data which we can remove using a template.

Result: boilerplate removed: the `name` field in each app.

{{{with code "en" "5"}}}
#location top-left top-left top-right top-right bottom
exec cue export --out yaml
cmp stdout out
-- policy.cue --
package config

app: [Name=_]: #App & {
	name: *"\(Name)" | _
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- alpha.cue --
package config

app: alpha: {
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	memory:   1024
	security: "medium"
}
-- out --
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
{{{end}}}

## Adding a new app is trivial

Add the `gamma` app.

We only need to care about non-standard config.
Result: the `gamma` app is added without boilerplate or redundant information.

{{{with code "en" "6"}}}
#location top-left top-left top-right top-right top-right bottom
exec cue export --out yaml
cmp stdout out
-- policy.cue --
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- gamma.cue --
package config

app: gamma: {
	port: 80
}
-- alpha.cue --
package config

app: alpha: {
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	memory:   1024
	security: "medium"
}
-- out --
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
{{{end}}}

## `cue trim`

Reset back to our initial apps + `gamma`, along with our `schema.cue` and `policy.cue` files.

Motivate example: what if we had hundreds of apps, all with full specifications manually created over time?

{{{with upload "en" "pre-trim"}}}
#location top-right top-right top-left top-left top-left
-- policy.cue --
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
-- schema.cue --
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
-- alpha.cue --
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
-- gamma.cue --
package config

app: gamma: {
	name:     "gamma"
	memory:   512
	port:     80
	security: "high"
}
{{{end}}}

{{{with script "en" "cue trim"}}}
cue trim
{{{end}}}

{{{with upload "en" "post-trim"}}}
#assert
-- alpha.cue --
package config

app: alpha: {
	security: "low"
}
-- beta.cue --
package config

app: beta: {
	memory:   1024
	security: "medium"
}
-- gamma.cue --
package config

app: gamma: {
	port: 80
}
{{{end}}}

{{{with script "en" "cue export"}}}
cue export --out yaml
{{{end}}}


## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about {{< linkto/inline "concept/how-cue-enables-configuration" >}}
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}}
