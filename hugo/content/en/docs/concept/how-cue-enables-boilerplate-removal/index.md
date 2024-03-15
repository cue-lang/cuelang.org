---
title: How CUE enables boilerplate removal
authors: [jpluscplusm,myitcv]
toc_hide: true
---

Boilerplate is noise that obscures the parts of a configuration that actually matter.
It includes things like
repeated field definitions,
redundant defaults, and
copy-pasted fragments that only exist to satisfy a schema or format.
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

## The example baseline

Let's start by looking at our example's initial configuration and describing how we use it.

In this hypothetical example, we run a set of applications on an orchestration system.
That system takes a YAML file as its input, which we produce from a CUE configuration source.
Our CUE currently describes two applications,
`alpha` and `beta`,
each in their own CUE file.
Together, these files specify the CUE package `config`,
which we export to produce the orchestration system's YAML.

Here's our current configuration source:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="left" >}}
package config

app: alpha: {
	name:     "Alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: {
	name:     "Beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

There is a good deal of boilerplate in these files -- such as the `port` value
always being `8080`, and each app's location (`app: alpha: ...`) containing its
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
    name: Alpha
    memory: 512
    port: "8080"
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}{{< /code-tabs >}}

## Introducing a schema

We'll continue by writing down a shared understanding of our configuration schema,
and then check that it matches our initial configuration source.
We'll validate that the `alpha` and `beta` configuration values conform to this
schema:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: #App & {
	name:     "Alpha"
	memory:   512
	port:     "8080"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: #App & {
	name:     "Beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

Writing down a schema doesn't remove any boilerplate by itself,
but is always a sensible first step in the process.

We re-export our configuration,
using the `-f` flag to overwrite our previous YAML file export.
We'll use this output to make sure that nothing's been changed by the introduction of our schema:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
    ./a.cue:6:12
    ./schema.cue:6:13
````

Our schema has already caught a type error in the `alpha` app's config.
Let's correct the problem in `a.cue` ...

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

#App: {
	name!:     string
	memory!:   int
	port!:     int
	security!: string
}
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: #App & {
	name:     "Alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: #App & {
	name:     "Beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

... and re-export to check that our orchestration system's configuration remains as expected:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
app:
  alpha:
    name: Alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

The type change correction in `alpha`'s `port` value is visible in the output.

## Using default values

Our first significant change introduces *defaults* to our configuration source.
Defaults define a baseline of common values shared by most configurations,
which can be overridden when a different value is more suitable.
Defaults are represented in CUE as an element of a disjunction that has a leading `*`.

We add our defaults in `policy.cue`. They're templated into each app's
configuration through unification, along with the `#App` definition.
We also manually remove values that match the defaults from `a.cue` and
`b.cue`:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

app: [_]: #App & _defaults
_defaults: {
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
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: {
	name:     "Alpha"
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: {
	name:     "Beta"
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

In our configuration it makes sense to define these default values:
- `memory` defaults to the smallest value of `512`, which will help us minimize
  costs in the future
- `port` captures the value that's already used by both `alpha` and `beta`
- `security` defaults to `high`, despite neither app specifying that value --
  we want apps to opt in explicitly when they need to run with a relaxed
  security posture

CUE ensures that wherever we remove a default value from `a.cue` or `b.cue`,
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
    name: Alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## Templating fixed values

There's one last piece of redundant data in our configuration:
each app's `name` field mirrors its path in the `app` struct.

We'll eliminate this boilerplate code by *templating* it into
each app using a *pattern constraint* in `policy.cue`.
This allows us to remove it manually from `a.cue` and `b.cue`:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

import "strings"

app: [Name=_]: #App & _defaults & {
	name: strings.ToTitle(Name)
}

_defaults: {
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
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

Our orchestration system's YAML remains unchanged, as expected:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
app:
  alpha:
    name: Alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## Adding new apps

We've removed a load of boilerplate using CUE's language features.
Now let's see how that work has reduced our maintenance burden when
adding a new app to the system. In this example we'd like to tell our
orchestration system to run the `gamma` app alongside `alpha` and `beta`.

The *default values* and *templates* introduced above allow us to add
`c.cue` containing only the app's non-standard configuration, and without any boilerplate:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

import "strings"

app: [Name=_]: #App & _defaults & {
	name: strings.ToTitle(Name)
}

_defaults: {
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
{{< /code-tab >}}{{< code-tab name="c.cue" language="cue" area="right" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}

The orchestration system's exported YAML includes the `gamma` app,
with our sensible and secure defaults in place:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
app:
  alpha:
    name: Alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
  gamma:
    name: Gamma
    memory: 512
    port: 80
    security: high
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

## Removing boilerplate at scale

The work we've just done to specify our *defaults* and *templates* above
was shared across all our apps. However, each time we used a language feature to
eliminate some boilerplate we *then* had to update `a.cue` and `b.cue`
manually to remove superfluous values.

Now imagine that our starting configuration specified hundreds or thousands of apps,
instead of just `alpha` and `beta`.
The work to update the entire configuration source after we try out each
language feature would be pretty significant!
Fortunately, CUE provides a shortcut: `cue trim`.

To demonstrate the command
we'll first reset our `alpha` and `beta` configuration source back to its baseline,
including the type correction we made in `a.cue`.
We'll keep the schema and policy files that we've developed throughout this guide,
and we'll also include the full specification for the `gamma` app -- boilerplate and all:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

import "strings"

app: [Name=_]: #App & _defaults & {
	name: strings.ToTitle(Name)
}

_defaults: {
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
{{< /code-tab >}}{{< code-tab name="a.cue" language="cue" area="right" >}}
package config

app: alpha: {
	name:     "Alpha"
	memory:   512
	port:     8080
	security: "low"
}
{{< /code-tab >}}{{< code-tab name="b.cue" language="cue" area="right" >}}
package config

app: beta: {
	name:     "Beta"
	memory:   1024
	port:     8080
	security: "medium"
}
{{< /code-tab >}}{{< code-tab name="c.cue" language="cue" area="right" >}}
package config

app: gamma: {
	name:     "Gamma"
	memory:   512
	port:     80
	security: "high"
}
{{< /code-tab >}}{{< /code-tabs >}}

With these files in place, and our baseline's boilerplate restored,
let's run `cue trim`:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0=" }
$ cue trim
````

We know the command was successful because it didn't display any output.
It updated our CUE files directly:

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package config

app: alpha: {
	security: "low"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="b.cue" language="cue" area="top-left" >}}
package config

app: beta: {
	memory:   1024
	security: "medium"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="c.cue" language="cue" area="top-left" >}}
package config

app: gamma: {
	port: 80
}
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

As before (after our manual updates) important facts stand out in each app:
custom `port`, `memory` and `security` settings are made clear.
One last export confirms that our orchestration system's YAML remains as expected:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtbyBjb25maWd1cmF0aW9uLnltbCAtZg==" }
$ cue export -o configuration.yml -f
````
{{<columns-separator>}}
{{< code-tabs >}}
{{< code-tab name="configuration.yml" language="yaml" area="top-left" >}}
app:
  alpha:
    name: Alpha
    memory: 512
    port: 8080
    security: low
  beta:
    name: Beta
    memory: 1024
    port: 8080
    security: medium
  gamma:
    name: Gamma
    memory: 512
    port: 80
    security: high
{{< /code-tab >}}{{< /code-tabs >}}
{{</columns>}}

Because the command has instantly removed all the unnecessary boilerplate for us,
we could even use it as an intrinsic part of the schema- and policy-development process.
We could speculatively add new policy constraints,
run `cue trim`, and then
use our version control system to see what changes have been made in our configuration source.
This lets us effortlessly scale the boilerplate removal process to any number of apps by
giving us immediate, holistic feedback on the effectiveness of trial policy changes.

## Conclusion

CUE's language features work together to let us specify configurations plainly and succinctly.
Features such as
*references*,
*string interpolation*,
*defaults*, and
*templates*
eliminate repetition, and
decrease the chances of making mistakes by reducing our maintenance burden.
They remove boilerplate, letting important details stand out clearly.

Building on these features, the `cue trim` command automates away the manual
work of removing redundant information from configuration sources. Its speed
allows it to be used as part of policy development, letting us evaluate policy
changes at scale. It allows speculative changes to be tested incrementally,
reducing refactoring risk by permitting us to make as many smaller changes as
needed. Larger, riskier changes are no longer driven by the significant toil
involved in making a single manual update across an entire configuration.
`cue trim` takes care of these updates for us -- letting us easily try out
policy updates at any scale.

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground]({{< relref "play" >}})
- Read about {{< linkto/inline "concept/how-cue-enables-configuration" >}}
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
- Read more in {{< linkto/related/reference "command/cue-help-trim" >}} --
  the command's built-in help text
