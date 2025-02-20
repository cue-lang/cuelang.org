---
title: Carving out submodules from modules
authors:
- myitcv
tags:
- modules
toc_hide: true
---

<!-- vim_ syntax highlighting hack -->

{{< step stepNumber="1" >}}

Create and publish the first version of the root-level module:

```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgbW9kMSBtYWlu" }
$ mkdir mod1 main
```

{{< /step >}}

{{< step stepNumber="2" >}}

Create and publish the first version of the root-level module:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgbW9kMQpjdWUgbW9kIGluaXQgLS1zb3VyY2U9c2VsZiBnaXRodWIuY29tL2N1ZWNrb28vbW9kMQ==" }
$ cd mod1
$ cue mod init --source=self github.com/cueckoo/mod1
```

{{< code-tabs >}}
{{< code-tab name="mod1/cue/schema/schema.cue" language="cue" area="top-left" >}}
package schema

#X: string
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQ==" }
$ cue mod publish v0.0.1
published github.com/cueckoo/mod1@v0.0.1 to registry.cue.works/github.com/cueckoo/mod1:v0.0.1
```

{{< /step >}}


{{< step stepNumber="3" >}}

Use the root-level module:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgLi4vbWFpbgpjdWUgbW9kIGluaXQgY3VlLmV4YW1wbGUvbWFpbg==" }
$ cd ../main
$ cue mod init cue.example/main
```

{{< code-tabs >}}
{{< code-tab name="main/main.cue" language="cue" area="top-left" >}}
package main

import "github.com/cueckoo/mod1/cue/schema"

X: schema.#X & "hello world"
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5CmN1ZSBleHBvcnQ=" }
$ cue mod tidy
$ cue export
{
    "X": "hello world"
}
```

{{< /step >}}


{{< step stepNumber="4" >}}

Create and publish submodule:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgLi4vbW9kMQpjZCBjdWUKY3VlIG1vZCBpbml0IC0tc291cmNlPXNlbGYgZ2l0aHViLmNvbS9jdWVja29vL21vZDEvY3VlCmN1ZSBtb2QgcHVibGlzaCB2MC4wLjE=" }
$ cd ../mod1

# Move to cue subdirectory
$ cd cue
$ cue mod init --source=self github.com/cueckoo/mod1/cue
$ cue mod publish v0.0.1
published github.com/cueckoo/mod1/cue@v0.0.1 to registry.cue.works/github.com/cueckoo/mod1/cue:v0.0.1
```

{{< /step >}}


{{< step stepNumber="5" >}}

Check whether our use "still works"

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgLi4vLi4vbWFpbgpybSAtciBjdWUubW9kCmN1ZSBtb2QgaW5pdCBjdWUuZXhhbXBsZS9tYWluCmN1ZSBtb2QgdGlkeQ==" }
$ cd ../../main

# remove cue.mod directory and re-init as clean way to remove
# all declared depdendencies
$ rm -r cue.mod
$ cue mod init cue.example/main

# This should now fail because we have the latest versions of
# the original root-level module and the submodule providing
# the same package
$ cue mod tidy
failed to resolve "github.com/cueckoo/mod1/cue/schema": ambiguous import: found package github.com/cueckoo/mod1/cue/schema in multiple modules:
	github.com/cueckoo/mod1@v0 v0.0.1 (cue/schema)
	github.com/cueckoo/mod1/cue@v0 v0.0.1 (schema)
```

{{< /step >}}


{{< step stepNumber="6" >}}

Fix by publishing an "empty" root-level module version:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgLi4vbW9kMQpjdWUgbW9kIHB1Ymxpc2ggdjAuMC4y" }
$ cd ../mod1
$ cue mod publish v0.0.2
published github.com/cueckoo/mod1@v0.0.2 to registry.cue.works/github.com/cueckoo/mod1:v0.0.2
```

{{< /step >}}


{{< step stepNumber="7" >}}

Check use now works again

```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgLi4vbWFpbgpybSAtciBjdWUubW9kCmN1ZSBtb2QgaW5pdCBjdWUuZXhhbXBsZS9tYWluCmN1ZSBtb2QgdGlkeQpjdWUgZXhwb3J0" }
$ cd ../main

# remove cue.mod directory and re-init as clean way to remove
# all declared depdendencies
$ rm -r cue.mod
$ cue mod init cue.example/main

# This should now work again
$ cue mod tidy
$ cue export
{
    "X": "hello world"
}
```

{{< /step >}}
