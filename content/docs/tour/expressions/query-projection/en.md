---
title: Queries and Projections
weight: 65
---

Comprehensions allow us to select and process data via queries and projections.

Queries select which data items we want to process,
and projections define the shape of each resulting item.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
_data: {
	foo: {a: 1, b: "a foo", c: true}
	bar: {a: 100, b: "some bar", c: false}
	baz: {a: 1000, b: "this is baz", c: false}
	quux: {a: 10000, b: "quux?", c: true}
}

result: {
	for k, v in _data
	if v.a < 10 || v.c || v.b =~ "bar" {
		(k): {
			b: v.b
			a: 1 + v.a*2
		}
	}
}
-- out --
result: {
    foo: {
        b: "a foo"
        a: 3
    }
    bar: {
        b: "some bar"
        a: 201
    }
    quux: {
        b: "quux?"
        a: 20001
    }
}
{{{end}}}
