---
title: How-to Guides
weight: 40
toc_hide: false
---

## About these guides

CUE's documentation site is divided into several sections. The "How-to Guides"
section contains:

- Guides that demonstrate how to use CUE tools: {{< tag "tooling" >}}
- Commented CUE guides that briefly illustrate CUE language features and
  techniques: {{< tag "commented cue" >}}
- Guides that contain step-by-step instructions for integrating CUE with 3rd
  party ecosystems and tools: {{< tag "ecosystem" >}}
- Guides that explain how to encode and decode information stored in languages
  other than CUE: {{< tag "encodings" >}}

Each guide has one or more tags, displayed at the top and bottom of the page.
Each tag links to a search page that shows other guides associated with the
same tag.

## Commented CUE guides

Some How-to Guides use CUE's useful style of
"[literate](https://en.wikipedia.org/wiki/Literate_programming) configuration".
We refer to them as {{< tag "commented cue" >}} guides.

Commented CUE guides tend to be short, presenting commented CUE code alongside
some input data, with a `cue` command showing the concrete result of the
technique they're demonstrating. Often that result is an error message, showing
that `cue` has caught the deliberate mistakes in our example data.

Here's an example:

{{{with code "en" "example"}}}
! exec cue vet .:example data.yml
cmp stderr out.err
-- example.cue --
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
-- data.yml --
f1: 123
f2: some string value
-- out.err --
f1: conflicting values 123 and string (mismatched types int and string):
    ./data.yml:1:5
    ./example.cue:10:5
f2: conflicting values "some string value" and int (mismatched types string and int):
    ./data.yml:2:5
    ./example.cue:15:6
{{{end}}}

Commented CUE guides require you, the reader, to *modify* their examples
before you use them. Don't use the CUE exactly as it's presented, but first
adapt the variable names and data structures to suit your configuration.

Unlike some of our longer, step-by-step guides, the features showcased in
Commented CUE guides are self-contained and -- we believe! -- easy to adapt to
any situation. Each guide has a "Related content" section containing links to
in-depth explanation and discussion of the techniques and language features
used.

If you find any guides confusing, incomplete, or not detailed enough, then we
would really appreciate you telling us about your experience - just use the
"Report an Issue" link at the very bottom of the guide's page!

## All available how-to guides
