---
title: About these guides
---

## How-to Guides

CUE's documentation site is divided into several sections. This section,
"How-to Guides", contains:

- Guides that demonstrate how to use CUE tools:
  [&#x1F50D;&nbsp;tag:tooling](TODO)
- CUE By Example guides that briefly illustrate CUE language features and
  techniques:
  [&#x1F50D;&nbsp;tag:CUE By Example](TODO)
- Longer form guides that show how to use more advanced techniques:
  [&#x1F50D;&nbsp;tag:FIXME](TODO)
- Guides that contain step-by-step instructions for integrating CUE with 3rd
  party ecosystems and tools:
  [&#x1F50D;&nbsp;tag:ecosystem](TODO)
- Guides that explain how to encode and decode information stored in languages
  other than CUE:
  [&#x1F50D;&nbsp;tag:encoding](TODO)

Each guide has one or more tags, displayed at the top and bottom of the page.
Each tag links to a search page that shows other guides associated with the
same tag.

## CUE By Example Guides

Some How-to Guides use CUE's useful style of
"[literate](https://en.wikipedia.org/wiki/Literate_programming) configuration".
We refer to them as "**CUE By Example**" guides.

CUE By Example guides tend to be short, presenting commented CUE code alongside
some input data, with a `cue` command showing the concrete result of the
technique they're demonstrating. Often that result is an error message, showing
that `cue` has caught the deliberate mistakes in our example data.

Here's an example:

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// CUE comments start with "//".
// they run to the end of the
// line

// f1 is a regular field which
// must be a string

f1: string

// f2 is a required field which
// must be an integer over 10

f2!: int & >10
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
# f1 is actually an integer
f1: 123

# f2 is actually a string
f2: "some string value"
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
f1: conflicting values 123 and string (mismatched types int and string):
    ./data.yml:2:6
    ./example.cue:9:5
f2: conflicting values "some string value" and int (mismatched types string and int):
    ./data.yml:5:6
    ./example.cue:14:6
{{< /code-tab >}}

{{< /code-tabs >}}

CUE By Example guides require you, the reader, to *modify* their examples
before you use them. Don't use the CUE exactly as it's presented, but first
adapt the variable names and data structures to suit your configuration.

Unlike some of our longer, step-by-step guides, the features showcased in CUE
By Example guides are self-contained and -- we believe! -- easy to adapt to any
situation. Each guide has a "Related content" section containing links to
in-depth explanation and discussion of the techniques and language features
used.

If you find any guides confusing, incomplete, or not detailed enough, then we
would really appreciate you [telling us](FIXME:docs-and-content-bug-tracker)
about your experience!
