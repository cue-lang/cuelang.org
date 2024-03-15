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

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
package example

webapp: {
	name:      "foo"
	id:        name + "-web"
	root:      "https://\(name).example.com"
	loginPage: root + "/login/"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
webapp:
  name: foo
  id: foo-web
  root: https://foo.example.com
  loginPage: https://foo.example.com/login/
{{< /code-tab >}}
{{< /code-tabs >}}

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

{{< code-tabs >}}
{{< code-tab name="alpha.cue" language="cue" area="left" >}}
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

There is a good deal of boilerplate in these files, such as the `port` value
always being `8080` and each app's location (`app: alpha: ...`) containing its
`name` field. We'll use different CUE features to show how they can be slimmed
down and made more maintainable.

Before we begin, let's export our orchestration system's YAML configuration:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbA==" }
$ cue export -o configuration.yml
````

This lets us see its "known good" state,
which will act as a baseline we can check our future exports against:

{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}


## V1: Include schema constraints FIXME: heading

Let's continue by writing down a shared understanding of our configuration schema,
and then check that it matches our baseline by validating that the `alpha` and
`beta` configuration values conform to that schema.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="right" >}}
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

This doesn't remove any boilerplate by itself, but is a necessary first step in the process.

We re-export our configuration to make sure nothing's changed,
using the `-f` flag to overwrite our previous export:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
    ./alpha.cue:6:12
    ./schema.cue:6:13
````

The addition of a schema has already caught a type error in the `alpha` app's config.

Let's correct the problem in `alpha.cue` ...

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="right" >}}
package config

app: alpha: #App & {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: #App & {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

... and re-export to check that our orchestration system's configuration remains unchanged:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## V2: Template policy constraints and defaults FIXME: heading

Our first significant change introduces *defaults* to our configuration source.
Defaults define a baseline of common values shared by most configurations,
which can be overridden when a different value is more suitable.
Defaults are represented in CUE as an element of a disjunction that has a leading `*`.

We add our defaults in `policy.cue`. They're templated into each app's
configuration through unification with the `#App` definition. We also manually
remove values that match the defaults from `alpha.cue` and `beta.cue`:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

app: [_]: #App
#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="right" >}}
package config

app: alpha: {
	name:     "alpha"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

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
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## V3: Template the remaining redundant data FIXME: heading

{{< TODO " " >}}

- There's one last piece of redundant data: the `name` field and each app's path in the `app` struct.
- we template it from policy.cue
- we set it as a default value that allows overriding if a future app needs to
- we manually remove it from alpha and beta
- Result: boilerplate removed: the `name` field in each app.

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

app: [Name=_]: #App & {
	name: *"\(Name)" | _
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

Our orchestration system's input remains unchanged, as expected:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## Adding a new app is trivial FIXME: heading

{{< TODO " " >}}

- Add the `gamma` app.
- We only need to care about non-standard config
- The `gamma` app is added without including boilerplate:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="gamma.cue" language="cue" area="right" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

The orchestration system's input now includes the `gamma` app, with our
sensible and secure defaults in place:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## `cue trim`

{{< TODO " " >}}

- Reset back to our initial 2 apps + `gamma`, along with our `schema.cue` and `policy.cue` files.
- The code we manually removed from alpha and beta has been restored
- Motivate example: what if we had hundreds of apps, all with full specifications manually created over time?

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="right" >}}
package config

app: [Name=_]: #App & {
	name: Name
}

#App: {
	memory:   *512 | 1024 | 2048
	port:     *8080 | 80
	security: *"high" | "medium" | "low"
}
{{< /code-tab >}}{{< code-tab name="schema.cue" language="cue" area="right" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="alpha.cue" language="cue" area="left" >}}
package config

app: alpha: {
	name:     "alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="beta.cue" language="cue" area="left" >}}
package config

app: beta: {
	name:     "beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< code-tab name="gamma.cue" language="cue" area="left" >}}
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

{{< TODO >}}

  - important differences stand out, such as apps with custom `port`, `memory` and `security` settings

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="alpha.cue" language="cue" area="top-left" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="beta.cue" language="cue" area="top-left" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="gamma.cue" language="cue" area="top-left" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

An export confirms that our orchestration system's input still contains all the
information it requires:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
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
