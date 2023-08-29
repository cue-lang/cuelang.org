---
title: About these guides
---

CUE's documentation is divided into several sections. This section, "How-to
Guides", contains:

- guides that demonstrate how to use CUE tools to complete specific tasks
  ([Link to search tag for this subset](TODO))
- guides that illustrate practical techniques for using CUE language features
  to encode different configuration styles, behaviours and results
  ([Link to search tag for this subset](TODO))
- guides that contain step-by-step instuctions showing how to integrate CUE
  with a wide range of 3rd party ecosystems and tools
  ([Link to search tag for this subset](TODO))

FIXME: add something about search? Link to generic search/operator help page?

## CUE By Example Guides

Some How-to Guides use CUE's highly productive style of
"[literate](https://en.wikipedia.org/wiki/Literate_programming) configuration"
to communicate.\
We refer to them as ["CUE By Example"](TODO:link-to-search-tag-for-CBE-guides)
guides.

CUE By Example guides tend to be short, presenting some commented CUE code
alongside some input data, with a `cue` command showing the concrete result of
the technique they're demonstrating.

As an example, this is the guide on
[marking a field as required](TODO:ref:"docs/howto/mark-a-field-as-required/"):

{{< code-tabs limitHeight=true >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// CUE indicates required fields
// with an exclamation mark: "!"

// f1 is required, and can be
// any value

f1!: _

// f-2 is required, and must be
// a string

"f-2"!: string

s1: {
	// f3 is required.
	// it must be an integer
	// under 10

	f3!: int & <10
}
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
f1: "some string value"
# f-2: field is missing
s1:
  f3: 7
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
"f-2": field is required but not present:
    ./example.cue:14:1
{{< /code-tab >}}

{{< /code-tabs >}}

These CUE By Example guides require you, the reader, to *modify* the CUE they
present - instead of copying it and using it exactly as it's written.

Unlike some of our longer, step-by-step guides, the features showcased in CUE
By Example guides are self-contained and -- we believe! -- easy to adapt to any
situation. Each guide contains links, in its "Related content" section, to more
in-depth explanation and discussion of the techniques and language features
used.

If you find any guides confusing, incomplete, or not detailed enough, then we
would really appreciate you [telling us](FIXME:docs-and-content-bug-tracker)
about your experience!
