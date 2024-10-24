---
title: 'Combining multiple "if" clauses'
authors: [jpluscplusm]
toc_hide: true
---

The CUE language allows conditional choices to decide if certain fields are
included in data. It provides multiple ways to combine conditions, and these
often produce equivalent results. However, in certain situations specific
mechanisms must be used to combine conditions, and this guide demonstrates some
of those situations.

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
