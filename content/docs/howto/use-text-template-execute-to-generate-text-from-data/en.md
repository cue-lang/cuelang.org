---
title: Using "text/template.Execute" to generate text from data
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`text/template.Execute`](https://pkg.go.dev/cuelang.org/go/pkg/text/template#Execute)
with data-driven templates to generate text output, using Go's
[template format](https://pkg.go.dev/text/template).

{{{with code "en" "cc"}}}
#location top bottom

exec cue export -e tasklist --out text
cmp stdout out
-- file.cue --
package example

import "text/template"

tasklist: template.Execute(message, data)
message: """
	Hello, {{ .name }}.
	
	Here are the tasks you still need to do:
	-- TODO --------------------------------
	{{ range $T := .incomplete -}}
	▢ {{ printf "%s [estimated effort: %v]" $T.name $T.effort }}
	{{ end }}
	You've already completed these tasks - well done!
	-- DONE -----------------------------------------
	{{ range $T := .complete -}}
	✅︎ {{ $T.name }}
	{{ end -}}
	"""
data: {
	name: "Alex"
	tasks: [{
		name:     "Write CUE how-to guide"
		effort:   1
		complete: true
	}, {
		name:     "Train for 10k race"
		effort:   4
		complete: false
	}, {
		name:     "Violin practise"
		effort:   3
		complete: false
	}, {
		name:     "Go shopping"
		effort:   3
		complete: true
	}, {
		name:     "Feed cat"
		effort:   1
		complete: false
	},
	]
	complete: [for t in tasks if t.complete {t}]
	incomplete: [for t in tasks if !t.complete {t}]
}
-- out --
Hello, Alex.

Here are the tasks you still need to do:
-- TODO --------------------------------
▢ Train for 10k race [estimated effort: 4]
▢ Violin practise [estimated effort: 3]
▢ Feed cat [estimated effort: 1]

You've already completed these tasks - well done!
-- DONE -----------------------------------------
✅︎ Write CUE how-to guide
✅︎ Go shopping

{{{end}}}

## Related content

- Go's documentation of [the template format](https://pkg.go.dev/text/template)
  used by `text/template.Execute`
- The [`text/template`](https://pkg.go.dev/cuelang.org/go/pkg/text/template)
  built-in package
- The example on this page is adapted from the excellent Cuetorials'
  [page](https://cuetorials.com/first-steps/generate-all-the-things/) on
  `text/template`
