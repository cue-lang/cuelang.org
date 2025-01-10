---
title: Modifying command output
weight: 30
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As shown throughout this guide, the `cue vet` command is either silent when
all its inputs validate successfully, or it displays error messages identifying
the cause of any validation failures.

By default, in addition to checking that there are no data inconsistencies,
`cue vet` also verifies that its inputs are
[*complete*]({{< relref "docs/concept/working-with-incomplete-cue" >}}).
In other words, it ensures that
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
would be able to produce a JSON or YAML configuration if it were invoked.
`cue vet` displays a generic error if this is not the case:

{{{with code "en" "concrete fail without -c"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
some instances are incomplete; use the -c flag to show errors or suppress this message
{{{end}}}

Use the `-c` flag to display specific errors about incomplete regular fields:

{{{with code "en" "concrete fail with -c"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
A: incomplete value >100 & int
{{{end}}}

The `-c` flag also has a long form: `--concrete`.

Use `-c=false` to check *only* for consistency by permitting incomplete regular
fields:

{{{with code "en" "concrete pass with -c=false"}}}
#location top bottom
exec cue vet -c=false
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
{{{end}}}

`cue vet -c=false` will still find consistency errors in your CUE:

{{{with code "en" "incomplete & inconsistent fail with -c=false"}}}
#location top bottom
! exec cue vet -c=false
cmp stderr out
-- file.cue --
package example

A:  int & >100
_B: int & string
#C: true & false
-- out --
#C: conflicting values false and true:
    ./file.cue:5:5
    ./file.cue:5:12
_B: conflicting values int and string (mismatched types int and string):
    ./file.cue:4:5
    ./file.cue:4:11
{{{end}}}

## Related content

- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you have feedback about ways that the command could
  be improved to help your workflows, the CUE project would love to hear it in
  that issue!
