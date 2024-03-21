---
title: "Currently broken CUE syntax highlighting"
toc_hide: true
---

This page exists solely to demonstrate the current state of Hugo/Chroma's CUE
syntax highlighting, specifically on language elements that aren't handled well.

{{{with code "en" "code"}}}
-- in.cue --
// Some types aren't highlighted the same as others
Types: {
	x: bytes // unhighlighted
	x: float
	x: int
	x: null   // bold but not blue, but maybe that's because it's a keyword
	x: number // unhighlighted
	x: string
}

// Quotes inside other string forms break out of string highlighting
Quotes: {
	x: #" foo "bar" baz "#
	x: """
		foo "bar" baz
		"""
	x: "foo \"bar\" baz" // works
	// Modified escape delimiters interact poorly with quotes inside strings
	Escapes: {
		x: #"foo "\U12345678" baz"#
		x: ##"""
			Here's a regex:
			    #"\d{3}"#
			"""##
	}
}

// Tags' at signs appear as an error
Tags: {
	who: *"World" | string @tag(who) // @-sign is red
}

// Comments without any text render wierdly.
//
// This will strike any guides where we import JSON Schema documents.

// Lots of non-ASCII characters are flagged as errors.
// Greek upper and lowercase:
Αα: "Alpha", Ββ: "Beta", Γγ:    "Gamma", Δδ:   "Delta", Εε: "Epsilon", Ζζ: "Zeta"
Ηη: "Eta", Θθ:   "Theta", Ιι:   "Iota", Κκ:    "Kappa", Λλ: "Lambda", Μμ:  "Mu"
Νν: "Nu", Ξξ:    "Xi", Οο:      "Omicron", Ππ: "Pi", Ρρ:    "Rho", Σσς:    "Sigma"
Ττ: "Tau", Υυ:   "Upsilon", Φφ: "Phi", Χχ:     "Chi", Ψψ:   "Psi", Ωω:     "Omega"
// German sharp S
ß: "sharp s", ẞ: "SHARP S"

// Valid double-double-quotes forces the rest of the file to be rendered as if
// it were inside quotes.
#Page: {
	title?:   strings.MinRunes(1)   // title cannot be empty.
	urlPath?: !=""                  // urlPath cannot be empty (equivalent constraint to "title").
	file?:    =~".html$" | =~".md$" // Content files can be HTML or Markdown.
	date?:    time.Time             // time.Time validates a RFC3339 date-time.
	summary?: strings.MaxRunes(150) // Our site layout requires page summaries to be limited in length.
	author?:  _                     // Policy imposes no additional constraints on the author.
	isDraft?: _
}
{{{end}}}
