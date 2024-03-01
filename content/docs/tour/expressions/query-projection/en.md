---
title: Queries and Projections
weight: 65
---

Comprehensions allow queries and projections to process data.

Queries select which data items are in scope, and projections select which
fields are in scope.

Because both operations are represented as comprehensions, they can be combined
into a single comprehension as needed. The example shown here demonstrates two
distinct phases: a query result being used by a projection.

{{{with code "en" "tour"}}}
exec cue eval queries.cue
cmp stdout out
-- queries.cue --
projection: {for k, v in _query {
	(k): {
		b: v.b
		a: v.a
	}
}}

_query: {
	for k, v in _data
	if v.a < 50 || v.c {(k): v}
}

_data: {
	foo: {a: 1, b: "a foo", c: true}
	bar: {a: 10, b: "some bar", c: true}
	baz: {a: 100, b: "this is baz", c: false}
	quux: {a: 1000, b: "quux?", c: true}
}
-- out --
projection: {
    foo: {
        b: "a foo"
        a: 1
    }
    bar: {
        b: "some bar"
        a: 10
    }
    quux: {
        b: "quux?"
        a: 1000
    }
}
{{{end}}}
