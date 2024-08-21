---
title: Using the built-in function "matchN" as a field validator
tags: [commented cue]
authors: [jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: access to cue tip"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

{{<caution>}}
This guide demonstrates a CUE feature that isn't yet available in a release.
It is only available in the `cue` command and Go API when they are
[installed from source]({{< relref "/docs/introduction/installation" >}}#install-from-source)
using the `@master` version selector.
{{</caution>}}

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function `matchN()` as a field validator, using the following unreleased
version of CUE:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{<caution>}}
FIXME: adapt example CUE
{{</caution>}}

<!-- We use an upload/script pair because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{<columns>}}
{{{with upload "en" "cc"}}}
-- example.cue --
package example

import "math"

#Foo: {
	a: int
}

match: {
	[=~"^single"]: matchN(1, [#Foo])
	singleOK: a:  2
	singleErr: a: "foo"

	[=~"^incomplete"]: matchN(1, [#Foo])
	incompleteOK: a:  int
	incompleteErr: a: string

	#A: {
		a: int
		b: _
		...
	}

	defaults: {
		// Because validators distribute over disjunctions, this validator may erase
		// a default value. Nonethenless, it will be guaranteed that the value
		// resulting from evaluation does not violate the validator.
		// TODO(defaults): take this use case into consideration for the defaults
		// rethink, as it seems less than ideal. Note that this typically not an
		// issue if the schema matched against is not concrete.
		[=~"^pickTop"]: matchN(1, [2])
		pickTopOK1: *2 | int
		pickTopOK2: int
		pickTopErr: *3 | int // Final values taken.

		// Nested default values will be evaluated and may not be overridden by
		// values in the validator.
		[=~"^pickNested1"]: matchN(1, [{a: 2}])
		pickNested1OK1: a: *2 | int
		pickNested1OK2: a: int
		pickNested1Err: a: *3 | int

		[=~"^pickNested2"]: matchN(1, [{a: <=2}])
		pickNested2OK1: a: *2 | int
		pickNested2OK2: a: int
		pickNested2Err: a: *3 | int
	}

	// Stress test potential exponential behavior.
	nestedOK: {
		matchN(4, [#A, #A, #A, #A])

		a: 2
		b: {
			matchN(4, [#A, #A, #A, #A])

			a: 3
			b: matchN(4, [#A, #A, #A, #A])
			b: a: 4
			c: matchN(4, [#A, #A, #A, #A])
			c: a: 5
		}
		c: {
			matchN(4, [#A, #A, #A, #A])

			a: 3
			b: matchN(4, [#A, #A, #A, #A])
			b: a: 4
			c: matchN(4, [#A, #A, #A, #A])
			c: a: 5
		}
	}
}

not: {
	[=~"^single"]: matchN(0, [#Foo])
	singleOK: a:  "foo"
	singleErr: a: 2

	[=~"^double"]: matchN(0, [matchN(0, [#Foo])])
	doubleOK: a:  2
	doubleErr: a: "foo"
}

oneOf: {
	[=~"^multiple1"]: matchN(1, [math.MultipleOf(3), math.MultipleOf(5)])

	multiple1Err1: 1

	multiple1OK1: 3
	multiple1OK2: 5

	multiple1Err2: 15
}

anyOf: {
	[=~"^multiple1"]: matchN(>0, [math.MultipleOf(3), math.MultipleOf(5)])

	multiple1Err1: 1

	multiple1OK1: 3
	multiple1OK2: 5
	multiple1OK3: 15
}

allOf: {
	[=~"^multiple1"]: matchN(2, [math.MultipleOf(3), math.MultipleOf(5)])

	multiple1Err1: 1
	multiple1Err2: 3
	multiple1Err3: 5

	multiple1OK1: 15
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "cc"}}}
! cue vet
{{{end}}}
{{</columns>}}
