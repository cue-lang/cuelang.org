---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.2 introduced the "aliasv2" experiment, which
replaces alias syntax with a more consistent form.

Enable the experiment on a per-file basis using the
`@experiment(aliasv2)`
attribute.

{{<info>}}
Because this experiment changes the meaning of currently valid CUE code, the
`cue fix --exp=aliasv2`
command should be used to update existing CUE files *before* adding the
`@experiment` attribute.

See [`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
for more information.
{{</info>}}

## Unified alias syntax

A unified `~` syntax replaces the use of `=` to declare an alias:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(aliasv2) // Enable the experiment.
package example

aField: A: 42

// This syntax declares a field alias (f) that
// refers to aField.
aField~f: {
    B: f.A + 1
}

// This syntax declares two aliases that refer to
// aField (F) and its label (L).
aField~(L,F): {
    C: L
    D: F.A + 2
}

// The aliases defined above are available in the
// same scope as the field that they reference.
"f": f
"L": L
"F": F
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "aField": {
        "A": 42,
        "B": 43,
        "C": "aField",
        "D": 44
    },
    "f": {
        "A": 42,
        "B": 43,
        "C": "aField",
        "D": 44
    },
    "L": "aField",
    "F": {
        "A": 42,
        "B": 43,
        "C": "aField",
        "D": 44
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

The unified `~` syntax replaces CUE's different alias forms.
Combined with `self` (see below), their specific replacements are outlined in
[the experiment's proposal document](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax).
Use `cue fix --exp=aliasv2` to apply the replacements to existing CUE automatically.

## The `self` identifier

The `self` identifier can now be used to refer to the innermost CUE
block that contains it:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(aliasv2) // Enable the experiment.
package example

A: O: 42
A: X: self.O + 1

B: [42, self[0] + 1]

let Root = self
C:   Root["-"] + 1
"-": 137
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
A:
  O: 42
  X: 43
B:
  - 42
  - 43
C: 138
'-': 137
{{< /code-tab >}}
{{< /code-tabs >}}

Binding an identifier to the top level of the file using a `let` declaration
(as with `Root`, above) can be useful when referring to top-level fields that
would otherwise be shadowed, or when the field's name is not a valid
identifier.

## Complementary features

The new alias syntax and `self` have been designed to work together,
supporting more complex aliasing scenarios.

In this example a pattern constraint alias in data.cue gives each app access to
its path label (`Label`) along with its field (`Field`). The use of `self` in
schema.cue is needed to refer to the values of `timeout` and `retry` that are
set in `apps`. Using a field alias declared on `#App` would refer to those
fields' values in the definition itself, and not the concrete values specified
in `apps`.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
@experiment(aliasv2)
package example

#App: {
	name!:    string
	timeout!: int
	retry!:   int
	fail!:    int
}

#App: {
	let app = self
	retry: *(app.timeout * 2) | _
	fail:  *(app.retry * 10) | _
}
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
@experiment(aliasv2)
package example

// Pattern constraint label+field aliases.
apps: [string]~(Label,Field): #App & {
	name: Label
	fail: Field.retry * 3
}

apps: {
	frontend: timeout: 20
	backend: {
		timeout: 60
		retry:   100
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
apps:
  frontend:
    name: frontend
    timeout: 20
    retry: 40
    fail: 120
  backend:
    name: backend
    timeout: 60
    retry: 100
    fail: 300
{{< /code-tab >}}
{{< /code-tabs >}}


## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
- {{< linkto/related/reference "command/cue-help-fix" >}} --
  update CUE code automatically, applying the latest fixes and language experiments
- [Comparison between current and proposed syntax](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax) --
  each of CUE's alias forms expressed as its experimental equivalent <!-- TODO: replace with cuelang.org doc -->
