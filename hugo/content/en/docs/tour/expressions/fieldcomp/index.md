---
title: Field Comprehensions
weight: 60
---

Fields can be generated using **field comprehensions**.

They use the same language building blocks as
[list comprehensions]({{< relref "listcomp" >}}):
`for` loops, `if` guards, and `let` declarations,
nested in any order.
As with
[interpolated field names]({{< relref "interpolfield" >}}),
generated fields can't be referred to directly,
with any reference needing to be made through the context of some containing
struct.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
import "strings"

#censusData: [
	{name: "Kinshasa", pop: 16_315_534},
	{name: "Lagos", pop:    15_300_000},
	{name: "Cairo", pop:    10_100_166},
	{name: "Giza", pop:     9_250_791},
]

city: {for index, value in #censusData
	let lower = strings.ToLower(value.name) {
		"\(lower)": {
			population: value.pop
			name:       value.name
			position:   index + 1
		}
	}
}

// Reference context is via the containing struct.
gizaPopulation:  city.giza.population
cairoPopulation: city["cairo"].population
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWMgZmlsZS5jdWU=" >}}
$ cue eval -c file.cue
city: {
    kinshasa: {
        population: 16315534
        name:       "Kinshasa"
        position:   1
    }
    lagos: {
        population: 15300000
        name:       "Lagos"
        position:   2
    }
    cairo: {
        population: 10100166
        name:       "Cairo"
        position:   3
    }
    giza: {
        population: 9250791
        name:       "Giza"
        position:   4
    }
}
gizaPopulation:  9250791
cairoPopulation: 10100166
{{< /code-tab >}}
{{< /code-tabs >}}
