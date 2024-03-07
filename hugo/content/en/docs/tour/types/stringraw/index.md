---
title: "\"Raw\" Strings"
weight: 50
---

CUE does not support raw strings in the strictest sense.
Instead it allows modifying the escape delimiter by requiring
an arbitrary number of hash `#` signs after the backslash by
enclosing a string literal in an equal number of hash signs on either end.

This works for normal and interpolated strings.
Quotes do not have to be escaped in such strings.

{{< code-tabs >}}
{{< code-tab name="stringraw.cue" language="cue" area="top" >}}
msg1: #"The sequence "\U0001F604" renders as \#U0001F604."#

msg2: ##"""
	A regular expression can conveniently be written as:

	    #"\d{3}"#

	This construct works for bytes, strings and their multi-line variants.
	"""##
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="bottom" >}}
msg1: "The sequence \"\\U0001F604\" renders as 😄."
msg2: """
    A regular expression can conveniently be written as:

        #"\\d{3}"#

    This construct works for bytes, strings and their multi-line variants.
    """
{{< /code-tab >}}
{{< /code-tabs >}}
