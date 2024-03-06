---
title: Interpolation
weight: 20
---

String and bytes literals support **interpolation**,
in both their single- and multi-line forms.

Any valid CUE expression may be used inside escaped parentheses.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
m:     "You are \(#cost-#budget) dollars over budget!"
email: """
   Here is a message from the finance team:
   
      \(m)
   
   Regards,
     Your friends on the 12th floor
   """

#cost:   102
#budget: 88
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtLW91dCB5YW1s" >}}
$ cue export file.cue --out yaml
m: You are 14 dollars over budget!
email: |-
  Here is a message from the finance team:

     You are 14 dollars over budget!

  Regards,
    Your friends on the 12th floor
{{< /code-tab >}}
{{< /code-tabs >}}
