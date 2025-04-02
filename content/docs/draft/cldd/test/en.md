---
title: test
---

Here is a file:

{{{with upload "en" "test"}}}
-- file.cue --
package p

import "{{{.MODULE1}}}"

x: true
{{{end}}}
