---
title: Interpolation
weight: 20
---

String and bytes literals support **interpolation**,
in both their single- and multi-line forms.

Any valid CUE expression may be used inside escaped parentheses.

{{{with code "en" "tour"}}}
exec cue export file.cue --out yaml
cmp stdout out
-- file.cue --
m:     "You are \(#cost-#budget) dollars over budget!"
email: """
   Here is a message from the finance team:
   
      \(m)
   
   Regards,
     Your friends on the 12th floor
   """

#cost:   102
#budget: 88
-- out --
m: You are 14 dollars over budget!
email: |-
  Here is a message from the finance team:

     You are 14 dollars over budget!

  Regards,
    Your friends on the 12th floor
{{{end}}}
