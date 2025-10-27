---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.2 introduced the "aliasv2" experiment, which
replaces CUE's alias syntax and makes it more regular and consistent.
It also introduces the implict `self` identifier, which refers to the CUE block
that contains it.

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

The experiment has two main effects.
The use of `=` to declare an alias is replaced with a unified `~` syntax:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(aliasv2) // Enable the experiment.
package example

aField: A: 42

// This syntax declares an alias, V, that
// refers to the value of aField.
aField~V: {
    B: V.A + 1
}

// This syntax declares 2 aliases, k and v, that
// refer to aField's name (k) and its value (v).
aField~(k,v): {
    C: k
    D: v.A + 2
}

// Each alias defined above is available in the
// same scope as the field that it references.
"V": V
"k": k
"v": v
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
    "V": {
        "A": 42,
        "B": 43,
        "C": "aField",
        "D": 44
    },
    "k": "aField",
    "v": {
        "A": 42,
        "B": 43,
        "C": "aField",
        "D": 44
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

The unified `~` syntax replaces all of CUE's different alias forms.
Their specific replacements are each outlined in
[the experiment's proposal document](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax).
Use `cue fix --exp=aliasv2` to apply the replacements to existing CUE automatically.

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

Binding an identifier to the top-level of the file using a `let` declaration
(as with `Root`, above) can be useful when referring to top-level fields that
would otherwise be shadowed, or when the field's name is not a valid
identifier.

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
- {{< linkto/related/reference "command/cue-help-fix" >}} --
  update CUE code automatically, applying the latest fixes and language experiments
- [Comparison between current and proposed syntax](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax) --
  each of CUE's alias forms expressed as its experimental equivalent <!-- TODO: replace with cuelang.org doc -->
