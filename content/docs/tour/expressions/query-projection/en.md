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
_data: {
	foo: {a: 1, b: "a foo", c: true}
	bar: {a: 10, b: "some bar", c: true}
	baz: {a: 100, b: "this is baz", c: false}
	quux: {a: 1000, b: "quux?", c: true}
}

// This comprehension selects which data items are
// in scope for the projection.
_query: {
	for k, v in _data
	if v.a < 50 || v.c {
		(k): v
	}
}

// This comprehension selects which fields are in
// scope for the output, and transforms one of the
// fields.
projection: {for k, v in _query {
	(k): {
		b: v.b
		a: 1 + v.a*2
	}
}}
-- out --
projection: {
    foo: {
        b: "a foo"
        a: 3
    }
    bar: {
        b: "some bar"
        a: 21
    }
    quux: {
        b: "quux?"
        a: 2001
    }
}
{{{end}}}
