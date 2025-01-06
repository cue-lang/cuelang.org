---
title: "Test: code block accessing a pre-release cue command"
---

### No blank line between `env` and `exec`

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
x: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="ZW52IFBBVEg9L2N1ZXMvJENVRUxBTkdfQ1VFX1BSRVJFTEVBU0U6JFBBVEg=" >}}
$ env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
cue version v0.11.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH amd64
            GOOS linux
         GOAMD64 v1
cue.lang.version v0.11.1
{{< /code-tab >}}
{{< /code-tabs >}}

### Blank line between `env` and `exec`

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
x: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZlcnNpb24=" >}}
$ cue version
cue version v0.11.1

go version go1.23.2
      -buildmode exe
       -compiler gc
       -trimpath true
  DefaultGODEBUG asynctimerchan=1,gotypesalias=0,httpservecontentkeepheaders=1,tls3des=1,tlskyber=0,x509keypairleaf=0,x509negativeserial=1
     CGO_ENABLED 0
          GOARCH amd64
            GOOS linux
         GOAMD64 v1
cue.lang.version v0.11.1
{{< /code-tab >}}
{{< /code-tabs >}}
