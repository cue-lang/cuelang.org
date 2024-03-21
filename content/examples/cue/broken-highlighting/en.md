---
title: CUE that breaks Hugo's syntax highlighting
toc_hide: true
---

This page demonstrates the current state of Hugo and Chroma syntax highlighting
on CUE language elements that aren't handled well.
Add to this page if you discover more examples.

{{{with code "en" "code"}}}
-- in.cue --
// Comment markers without a trailing comment render wierdly.
// This will strike any guides where we import JSON Schema documents.
//

// Some types aren't highlighted the same as others
Types: {
	x: bytes // unhighlighted
	x: float
	x: int
	x: null   // bold but not blue, but maybe that's because it's a keyword
	x: number // unhighlighted
	x: string
}

// Lots of non-ASCII characters are flagged as errors.
// Greek upper and lowercase:
Αα: "Alpha", Ββ: "Beta", Γγ:    "Gamma", Δδ:   "Delta", Εε: "Epsilon", Ζζ: "Zeta"
Ηη: "Eta", Θθ:   "Theta", Ιι:   "Iota", Κκ:    "Kappa", Λλ: "Lambda", Μμ:  "Mu"
Νν: "Nu", Ξξ:    "Xi", Οο:      "Omicron", Ππ: "Pi", Ρρ:    "Rho", Σσς:    "Sigma"
Ττ: "Tau", Υυ:   "Upsilon", Φφ: "Phi", Χχ:     "Chi", Ψψ:   "Psi", Ωω:     "Omega"
// German sharp S
ß: "sharp s", ẞ: "SHARP S"

// Quotes inside other string forms break out of string highlighting
DoubleQuotes: {
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

// Valid double-double-quotes forces the rest of the file to be rendered as if
// it were inside quotes.
DoubleDoubleQuotes: {
	title?:   strings.MinRunes(1)   // title cannot be empty.
	urlPath?: !=""                  // urlPath cannot be empty (equivalent constraint to "title").
	file?:    =~".html$" | =~".md$" // Content files can be HTML or Markdown.
	date?:    time.Time             // time.Time validates a RFC3339 date-time.
	summary?: strings.MaxRunes(150) // Our site layout requires page summaries to be limited in length.
	author?:  _                     // Policy imposes no additional constraints on the author.
	isDraft?: _
}
{{{end}}}
