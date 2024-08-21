---
title: Using the built-in function "matchN" as a field validator
tags: [commented cue]
authors: [jpluscplusm]
toc_hide: true
---

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.0-0.dev.0.20240820111527-0a41a20985d3
...
```

{{<caution>}}
FIXME: adapt example CUE
{{</caution>}}

<!-- We use an upload/script pair because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldA==" }
$ cue vet
match.singleErr: invalid value {a:"foo"} (does not satisfy matchN(1, [{a:int}])): 0 matched, expected 1:
    ./example.cue:10:17
    ./example.cue:10:24
    ./example.cue:12:13
match.incompleteErr: invalid value {a:string} (does not satisfy matchN(1, [{a:int}])): 0 matched, expected 1:
    ./example.cue:14:21
    ./example.cue:14:28
    ./example.cue:16:17
match.defaults.pickNested1Err: invalid value {a:*3 | int} (does not satisfy matchN(1, [{a:2}])): 0 matched, expected 1:
    ./example.cue:38:23
    ./example.cue:38:30
    ./example.cue:41:19
match.defaults.pickNested2Err: invalid value {a:*3 | int} (does not satisfy matchN(1, [{a:<=2}])): 0 matched, expected 1:
    ./example.cue:43:23
    ./example.cue:43:30
    ./example.cue:46:19
not.singleErr: invalid value {a:2} (does not satisfy matchN(0, [{a:int}])): 1 matched, expected 0:
    ./example.cue:76:17
    ./example.cue:76:24
    ./example.cue:78:13
not.doubleErr: invalid value {a:"foo"} (does not satisfy matchN(0, [matchN(0, [#Foo])])): 1 matched, expected 0:
    ./example.cue:80:17
    ./example.cue:80:24
    ./example.cue:82:13
oneOf.multiple1Err1: invalid value 1 (does not satisfy matchN(1, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected 1:
    ./example.cue:86:20
    ./example.cue:86:27
    ./example.cue:88:17
oneOf.multiple1Err2: invalid value 15 (does not satisfy matchN(1, [math.MultipleOf(3),math.MultipleOf(5)])): 2 matched, expected 1:
    ./example.cue:86:20
    ./example.cue:86:27
    ./example.cue:93:17
anyOf.multiple1Err1: invalid value 1 (does not satisfy matchN(>0, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected >0:
    ./example.cue:97:20
    ./example.cue:97:27
    ./example.cue:99:17
allOf.multiple1Err1: invalid value 1 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 0 matched, expected 2:
    ./example.cue:107:20
    ./example.cue:107:27
    ./example.cue:109:17
allOf.multiple1Err2: invalid value 3 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 1 matched, expected 2:
    ./example.cue:107:20
    ./example.cue:107:27
    ./example.cue:110:17
allOf.multiple1Err3: invalid value 5 (does not satisfy matchN(2, [math.MultipleOf(3),math.MultipleOf(5)])): 1 matched, expected 2:
    ./example.cue:107:20
    ./example.cue:107:27
    ./example.cue:111:17
```
{{</columns>}}
