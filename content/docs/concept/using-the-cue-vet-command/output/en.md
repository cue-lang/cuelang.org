---
title: Modifying command output
---

As described earlier in this guide, the `cue vet` command is either silent when
all its inputs validate successfully, or it displays error messages identifying
the cause of any validation failures.

By default, in addition to checking that there are no data inconsistencies,
`cue vet` verifies that its inputs are
[*complete*]({{< relref "docs/concept/working-with-incomplete-cue" >}}).
In other words, it ensures that
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
would be able to produce a JSON or YAML configuration if it were invoked.
`cue vet` displays a general error if this is not the case:

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

To display specific errors about incomplete regular fields use the `--concrete`/`-c` flag:

{{{with code "en" "concrete fail with -c"}}}
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
A: incomplete value >100 & int
{{{end}}}

To permit incomplete fields, and to check only for consistency, use `--concrete=false`/`-c=false`:

{{{with code "en" "concrete pass with -c=false"}}}
exec cue vet -c=false
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
{{{end}}}

You can use `cue vet -c=false` to find consistency errors in your CUE:

{{{with code "en" "incomplete & inconsistent fail with -c=false"}}}
#location top bottom
! exec cue vet -c=false
cmp stderr out
-- file.cue --
package example

A: int & string
-- out --
A: conflicting values int and string (mismatched types int and string):
    ./file.cue:3:4
    ./file.cue:3:10
{{{end}}}

## Related content

- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the built-in `cue vet` help text
