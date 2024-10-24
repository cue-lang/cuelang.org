---
title: 'Combining multiple "if" clauses'
authors: [jpluscplusm]
toc_hide: true
tags: [commented cue]
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to combine more than one `if` clause. This can be useful when
your decison to include data needs to be based on multiple conditions.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

// All these examples represent identical
// combinations of the same set of "if" clauses.

// All conditions on separate lines:
if #A < 100
if #B > 100
if (#C & number) != _|_
if #A < #C
if #B < #C {
	success: true
}

// Some conditions on the same line and some on
// separate lines:
if #A < 100 if #B > 100
if (#C & number) != _|_
if #A < #C if #B < #C {
	success: true
}

// All conditions on the same line:
if #A < 100 if #B > 100 if (#C & number) != _|_ if #A < #C if #B < #C {
	success: true
}

#A: 42
#B: 137
#C: 10101
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "success": true
}
{{< /code-tab >}}
{{< /code-tabs >}}

{{<info>}}
Because `if` clauses can be used in
[list comprehensions]({{< relref "/docs/tour/expressions/listcomp" >}})
and
[field comprehensions]({{< relref "/docs/tour/expressions/fieldcomp" >}}),
the
[conditional field]({{< relref "/docs/tour/expressions/conditional" >}})
examples demonstrated above are valid in both contexts.
{{</info>}}

## Related content

- {{< linkto/related/tour "expressions/conditional" >}}
- {{< linkto/related/tour "expressions/listcomp" >}}
- {{< linkto/related/tour "expressions/fieldcomp" >}}
