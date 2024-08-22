---
title: Aliases don't work in script blocks
---

Aliases don't work in script blocks:

```text { title="TERMINAL" type="terminal" codeToCopy="YWxpYXMKYWxpYXMgZm9vPSJlY2hvIGhlbGxvIgphbGlhcwpmb28KYWxpYXMKdW5hbGlhcyBmb28KYWxpYXM=" }
$ alias
$ alias foo="echo hello"
$ alias
alias foo='echo hello'
$ foo
/scripts/script.sh: line 49: foo: command not found
$ alias
alias foo='echo hello'
$ unalias foo
$ alias
```
