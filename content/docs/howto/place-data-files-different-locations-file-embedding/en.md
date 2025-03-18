---
title: Placing data files at different locations using file embedding
toc_hide: true
authors: [jpluscplusm]
---

CUE v0.12.0 introduced
[file embedding]({{<relref"docs/reference/command/cue-help-embed">}}),
which enables a powerful way for CUE configurations to consume data files.

This guide demonstrates how to use file embedding as a flexible alternative to the
[`--path`/`-l` flag]({{<relref"docs/concept/using-the-cue-export-command/inputs/#non-cue-data-location">}})
when handling multiple data files:
allowing their contents to be placed at arbitrary locations in an evaluation;
to be validated by different constraints;
and to have their data used elsewhere in the configuration.

{{{with code "en" "cc"}}}
#location top-left top-right top-right bottom
# A module is required to use embedding, but we don't demonstrate it here so
# that we can use a code block.
exec cue mod init

exec cue export --out yaml
cmp stdout out
-- file.cue --
@extern(embed)

package example

// Embed the contents of the data files.
_places: _ @embed(file=addresses.yml)
_dates:  _ @embed(file=birthdays.json)

// Validate the contents of the data files.
_places: [_]: [string, ...string]
_dates: [_]: =~#"^\d{4}-\d{2}-\d{2}$"#

// Emit the selected data.
jamie: {
	address:  _places.jamie
	birthday: _dates.jamie
}
-- addresses.yml --
jamie:
  - 1 Main Street
  - Townsville
  - West Fooshire
alex:
  - 42 The Parade
  - Village-on-the-Wold
  - Countyshire
-- birthdays.json --
{
    "alex": "1984-02-29",
    "jamie": "2000-01-01",
    "charlie": "1950-06-26"
}
-- out --
jamie:
  address:
    - 1 Main Street
    - Townsville
    - West Fooshire
  birthday: "2000-01-01"
{{{end}}}

## Related content

- {{<linkto/related/reference"command/cue-help-embed">}}
- {{<linkto/related/howto"embed-files-in-cue-evaluation">}}
