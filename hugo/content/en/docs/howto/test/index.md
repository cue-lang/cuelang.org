---
title: "Test: code block accessing a pre-release cue command"
---

### Blank line between `env` and `exec`

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
x: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZlcnNpb24=" >}}
$ cue version
cue version v0.12.0-alpha.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH arm64
            GOOS linux
         GOARM64 v8.0
cue.lang.version v0.12.0
{{< /code-tab >}}
{{< /code-tabs >}}
