---
title: Aliases don't work in script blocks
---

Aliases don't work in script blocks:

{{{with script "en" "."}}}
alias
alias foo="echo hello"
alias
! foo
alias
unalias foo
alias
{{{end}}}
