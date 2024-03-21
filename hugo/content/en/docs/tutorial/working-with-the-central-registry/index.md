---
title: Working with modules and the Central Registry
authors:
- myitcv
tags:
- modules
- tooling
- cue command
toc_hide: true
---

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24K" }
$ cue version
cue version v0.9.0-0.dev.0.20240320164829-623b6a8972bf
...
```

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXMK" }
$ export CUE_EXPERIMENT=modules
```

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdsYWNpYWwtdGVjaC5leGFtcGxlL2Zyb3N0eWFwcEB2MAo=" }
$ cue mod init glacial-tech.example/frostyapp@v0
```

```cue { title="config.cue" }
package frostyapp

import "github.com/myitcvscratch/publiccuemodules/2024-03-20/glacial-tech.example/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5Cg==" }
$ cue mod tidy
```

```text { title="TERMINAL" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQo=" }
$ cat cue.mod/module.cue
module: "glacial-tech.example/frostyapp@v0"
language: {
	version: "v0.9.0-0.dev"
}
deps: {
	"github.com/myitcvscratch/publiccuemodules/2024-03-20/glacial-tech.example/frostyconfig@v0": {
		v: "v0.1.0"
	}
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1sCg==" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

