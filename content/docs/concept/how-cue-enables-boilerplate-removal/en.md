---
title: How CUE enables boilerplate removal
authors: [jpluscplusm,myitcv]
toc_hide: true
---

Boilerplate is noise that obscures the parts of a configuration that actually matter.
It includes things like
repeated field definitions,
redundant defaults, and
copy-pasted fragments that exist only to satisfy a schema or format.
Even worse, code that includes boilerplate increases
our maintenance burden and
the chances of making mistakes.

You might already be using CUE to reduce configuration boilerplate
through some of its basic features,
such as *references* and *string interpolation*.
These reduce the toil involved when updating a configuration
by allowing information to be specified just once,
at its single source of truth --
such as the `name` field in this example:

{{{with code "en" "intro: references"}}}
exec cue export --out yaml
cmp stdout out
-- config.cue --
package example

webapp: {
	name:      "foo"
	id:        name + "-web"
	root:      "https://\(name).example.com"
	loginPage: root + "/login/"
}
-- out --
webapp:
  name: foo
  id: foo-web
  root: https://foo.example.com
  loginPage: https://foo.example.com/login/
{{{end}}}

The CUE language provides several other features which help eliminate boilerplate code.
This guide demonstrates these features in action by progressively simplifying a configuration.
The CUE source becomes more compact and easier for humans to work with, while
the exported JSON or YAML remains identical for the systems that consume it.
Make sure to read through to the end,
where we'll see a powerful command which *automatically* removes boilerplate for us!

## V0: starting point FIXME: heading

### Context FIXME: heading + bullet points

- we run a pair of applications, `alpha` and `beta`
- each application's config is stored in a separate CUE file
- together, these CUE files specify the `config` package
- we export the `config` package to produce the YAML required by our orchestration system

Here's where our configuration source begins:

{{{with upload "en" "baseline input"}}}
#location left right
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
{{{end}}}

There is a good deal of boilerplate in these files, such as the `port` value
always being `8080` and each app's location (`app: alpha: ...`) containing its
`name` field. We'll use different CUE features to show how they can be slimmed
down and made more maintainable.

Before we begin, let's export our orchestration system's YAML configuration:

{{{with script "en" "baseline export"}}}
cue export -o configuration.yml
{{{end}}}

This lets us see its "known good" state,
which will act as a baseline we can check our future exports against:

{{{with upload "en" "baseline output"}}}
#assert
-- configuration.yml --
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


## V1: Include schema constraints FIXME: heading

Let's continue by writing down a shared understanding of our configuration schema,
and then check that it matches our baseline by validating that the `alpha` and
`beta` configuration values conform to that schema.

{{{with upload "en" "schema"}}}
#location left right right
#force
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
{{{end}}}

This doesn't remove any boilerplate by itself, but is a necessary first step in the process.

We re-export our configuration to make sure nothing's changed,
using the `-f` flag to overwrite our previous export:

{{{with script "en" "schema failure"}}}
! cue export -o configuration.yml -f
{{{end}}}

The addition of a schema has already caught a type error in the `alpha` app's config.

Let's correct the problem in `alpha.cue` ...

{{{with upload "en" "schema reupload"}}}
#location left right right
#force
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
{{{end}}}

... and re-export to check that our orchestration system's configuration remains unchanged:

{{<columns>}}
{{{with script "en" "schema pass"}}}
cue export -o configuration.yml -f
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "schema output"}}}
#assert
-- configuration.yml --
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
{{</columns>}}

## V2: Template policy constraints and defaults FIXME: heading

Our first significant change introduces *defaults* to our configuration source.
Defaults define a baseline of common values shared by most configurations,
which can be overridden when a different value is more suitable.
Defaults are represented in CUE as an element of a disjunction that has a leading `*`.

We add our defaults in `policy.cue`. They're templated into each app's
configuration through unification with the `#App` definition. We also manually
remove values that match the defaults from `alpha.cue` and `beta.cue`:

{{{with upload "en" "defaults"}}}
#location left left right right
#force
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
{{{end}}}

In our configuration it makes sense to define these default values:
- `memory` defaults to the smallest value of `512`, which will help us minimize
  costs in the future
- `port` captures the value that's already used by both `alpha` and `beta`
- `security` defaults to `high`, despite neither app specifying that value, as
  we want apps to opt in explicitly when they need to run with a more relaxed
  security posture

CUE ensures that wherever we removed a default value from `alpha` or `beta`,
it's still present in the output exported for our orchestration system:

{{<columns>}}
{{{with script "en" "defaults"}}}
cue export -o configuration.yml -f
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "defaults output"}}}
#assert
-- configuration.yml --
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
{{</columns>}}

## V3: Template the remaining redundant data FIXME: heading

{{< TODO " " >}}

- There's one last piece of redundant data: the `name` field and each app's path in the `app` struct.
- we template it from policy.cue
- we set it as a default value that allows overriding if a future app needs to
- we manually remove it from alpha and beta
- Result: boilerplate removed: the `name` field in each app.

{{{with upload "en" "name"}}}
#location left left right right
#force
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
{{{end}}}

Our orchestration system's input remains unchanged, as expected:

{{<columns>}}
{{{with script "en" "name"}}}
cue export -o configuration.yml -f
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "name output"}}}
#assert
-- configuration.yml --
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
{{</columns>}}

## Adding a new app is trivial FIXME: heading

{{< TODO " " >}}

- Add the `gamma` app.
- We only need to care about non-standard config
- The `gamma` app is added without including boilerplate:

{{{with upload "en" "extra app"}}}
#location left left right right right
#force
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
{{{end}}}

The orchestration system's input now includes the `gamma` app, with our
sensible and secure defaults in place:

{{<columns>}}
{{{with script "en" "extra app"}}}
cue export -o configuration.yml -f
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "extra app output"}}}
#assert
-- configuration.yml --
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
{{</columns>}}

## `cue trim`

{{< TODO " " >}}

- Reset back to our initial 2 apps + `gamma`, along with our `schema.cue` and `policy.cue` files.
- The code we manually removed from alpha and beta has been restored
- Motivate example: what if we had hundreds of apps, all with full specifications manually created over time?

{{{with upload "en" "pre-trim source"}}}
#location right right left left left
#force
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

{{< TODO " " >}}

{{{with script "en" "trim"}}}
cue trim
{{{end}}}

{{< TODO >}}

  - important differences stand out, such as apps with custom `port`, `memory` and `security` settings

{{<columns>}}
{{{with upload "en" "post-trim alpha"}}}
#assert
-- alpha.cue --
package config

app: alpha: {
	security: "low"
}
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "post-trim beta"}}}
#assert
-- beta.cue --
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "post-trim gamma"}}}
#assert
-- gamma.cue --
package config

app: gamma: {
	port: 80
}
{{{end}}}
{{</columns>}}

An export confirms that our orchestration system's input still contains all the
information it requires:

{{<columns>}}
{{{with script "en" "post-trim export"}}}
cue export -o configuration.yml -f
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "post-trim output"}}}
#assert
-- configuration.yml --
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
{{</columns>}}

## Conclusion

{{< TODO " " >}}

- Reiterate benefits:
  - repetition eliminated
  - reduced maintenance burden
  - less opportunity for mistakes
  - important details stand out when reading individual app configurations
- `cue trim` makes updates possible at scale
  - changes can be made speculatively or incrementally
  - ... i.e. more safely than making changes all-at-once so as to avoid
    repeated manual updates to large configurations

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about {{< linkto/inline "concept/how-cue-enables-configuration" >}}
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
  - TODO: link to defaults
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}} --
  the command's built-in help text
